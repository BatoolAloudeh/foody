
import 'package:app1/models/waiter/getOrder.dart';

abstract class GetOrderWaiterStates {}
class GetOrderWaiterInitialState extends GetOrderWaiterStates{}
class GetOrderWaiterLoadingState extends GetOrderWaiterStates {}
class GetOrderWaiterSuccessState extends GetOrderWaiterStates {
  late final GetOrderWaiterModel getOrderWaiterModel;
  GetOrderWaiterSuccessState(this.getOrderWaiterModel);
}
class GetOrderWaiterErrorState extends GetOrderWaiterStates {
  late final String error;
  GetOrderWaiterErrorState(this.error);}