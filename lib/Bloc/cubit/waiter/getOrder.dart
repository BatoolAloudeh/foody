import 'package:app1/Bloc/states/waiter/getOrder.dart';
import 'package:app1/constant/endPoint/endPoints.dart';
import 'package:app1/models/waiter/getOrder.dart';
import 'package:bloc/bloc.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrderWaiterCubit extends Cubit<GetOrderWaiterStates> {
  GetOrderWaiterCubit() : super(GetOrderWaiterInitialState());

  static GetOrderWaiterCubit get(context) => BlocProvider.of(context);
  late GetOrderWaiterModel getOrderWaiterModel;

  void getOrders() {
    emit(GetOrderWaiterLoadingState());
    DioHelper.getData(url: GETORDERWAITER).then((value) {
      getOrderWaiterModel = GetOrderWaiterModel.fromJson(value.data);
      emit(GetOrderWaiterSuccessState(getOrderWaiterModel));
    }).catchError((error) {
      print("Error: ${error.toString()}");
      emit(GetOrderWaiterErrorState(error.toString()));
      print("Error: ${error.toString()}");
    });
  }
}
