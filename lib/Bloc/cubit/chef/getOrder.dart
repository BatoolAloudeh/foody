
import 'package:app1/Bloc/states/chef/getOrder.dart';
import 'package:app1/constant/endPoint/endPoints.dart';
import 'package:bloc/bloc.dart';
import 'package:app1/models/chef/getOrder.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
// class GetOrderChefCubit extends Cubit<GetOrderChefStates> {
//   GetOrderChefCubit() : super(GetOrderChefInitialState());
//
//   static GetOrderChefCubit get(context) => BlocProvider.of(context);
//   late GetOrderChefModel getOrderChefModel;
//
//   void getOrders() {
//     emit(GetOrderChefLoadingState());
//     DioHelper.getData(url: GETORDERCHEF).then((value) {
//       getOrderChefModel = GetOrderChefModel.fromJson(value.data);
//       emit(GetOrderChefSuccessState(getOrderChefModel));
//     }).catchError((error) {
//       print("Error: ${error.toString()}");
//       emit(GetOrderChefErrorState(error.toString()));
//       print("Error: ${error.toString()}");
//     });
//   }
// }






class GetOrderChefCubit extends Cubit<GetOrderChefStates> {
  GetOrderChefCubit() : super(GetOrderChefInitialState());

  static GetOrderChefCubit get(context) => BlocProvider.of(context);
  late GetOrderChefModel getOrderChefModel;

  Future<void> getOrders() async {
    emit(GetOrderChefLoadingState());
    try {
      final value = await DioHelper.getData(url: GETORDERCHEF);
      getOrderChefModel = GetOrderChefModel.fromJson(value.data);
      emit(GetOrderChefSuccessState(getOrderChefModel));
    } catch (error) {
      print("Error: ${error.toString()}");
      emit(GetOrderChefErrorState(error.toString()));
    }
  }
}
