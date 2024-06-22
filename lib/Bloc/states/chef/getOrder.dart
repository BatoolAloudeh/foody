import 'package:app1/models/chef/getOrder.dart';

abstract class GetOrderChefStates {}
class GetOrderChefInitialState extends GetOrderChefStates{}
class GetOrderChefLoadingState extends GetOrderChefStates {}
class GetOrderChefSuccessState extends GetOrderChefStates {
  late final GetOrderChefModel getOrderChefModel;
  GetOrderChefSuccessState(this.getOrderChefModel);
}
class GetOrderChefErrorState extends GetOrderChefStates {
  late final String error;
  GetOrderChefErrorState(this.error);}