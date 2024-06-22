
import 'package:app1/Bloc/states/chef/startPreparing.dart';
import 'package:app1/constant/endPoint/endPoints.dart';
import 'package:app1/models/chef/startPreparing.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class StartPreparingCubit extends Cubit<StartPreparingStates> {
  StartPreparingCubit() : super(StartPreparingInitialState());
  static StartPreparingCubit get(context) => BlocProvider.of(context);
  late StartPreparingModel startPreparingModel;

  Future<void> startPreparing({
    required int order_id,
  }) async {
    emit(StartPreparingLoadingState());

    DioHelper.putData(
      url: STARTPREPARING,
      data: {
        'order_id': order_id,

      },
    ).then((value) async {

      print(value.data);
      startPreparingModel = StartPreparingModel.fromJson(value.data);
      emit(StartPreparingSuccessState(startPreparingModel));
    }).catchError((error) {
      print("Error: ${error.toString()}");
      emit(StartPreparingErrorState(error.toString()));
    });
  }
}
