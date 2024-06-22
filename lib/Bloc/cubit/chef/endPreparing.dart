
import 'package:app1/Bloc/states/chef/endPreparing.dart';
import 'package:app1/Bloc/states/chef/startPreparing.dart';
import 'package:app1/constant/endPoint/endPoints.dart';
import 'package:app1/models/chef/endPreparing.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EndPreparingCubit extends Cubit<EndPreparingStates> {
  EndPreparingCubit() : super(EndPreparingInitialState());
  static EndPreparingCubit get(context) => BlocProvider.of(context);
  late EndPreparingModel endPreparingModel;

  Future<void> endPreparing({
    required int order_id,
  }) async {
    emit(EndPreparingLoadingState());

    DioHelper.putData(
      url: ENDPREPARING,
      data: {
        'order_id': order_id,

      },
    ).then((value) async {

      print(value.data);
      endPreparingModel = EndPreparingModel.fromJson(value.data);
      emit(EndPreparingSuccessState(endPreparingModel));
    }).catchError((error) {
      print("Error: ${error.toString()}");
      emit(EndPreparingErrorState(error.toString()));
    });
  }
}
