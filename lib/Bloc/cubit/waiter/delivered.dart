
import 'package:app1/Bloc/states/chef/startPreparing.dart';
import 'package:app1/Bloc/states/waiter/delivered.dart';
import 'package:app1/constant/endPoint/endPoints.dart';
import 'package:app1/models/chef/startPreparing.dart';
import 'package:app1/models/waiter/delivered.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DeliveredCubit extends Cubit<DeliveredStates> {
  DeliveredCubit() : super(DeliveredInitialState());
  static DeliveredCubit get(context) => BlocProvider.of(context);
  late DeliveredModel deliveredModel;

  Future<void> delivered({
    required int order_id,
  }) async {
    emit(DeliveredLoadingState());

    DioHelper.putData(
      url: DELIVERED,
      data: {
        'order_id': order_id,

      },
    ).then((value) async {

      print(value.data);
      deliveredModel = DeliveredModel.fromJson(value.data);
      emit(DeliveredSuccessState(deliveredModel));
    }).catchError((error) {
      print("Error: ${error.toString()}");
      emit(DeliveredErrorState(error.toString()));
    });
  }
}
