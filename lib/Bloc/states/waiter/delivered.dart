
import 'package:app1/models/waiter/delivered.dart';

abstract class DeliveredStates {}
class DeliveredInitialState extends DeliveredStates{}
class DeliveredLoadingState extends DeliveredStates {}
class DeliveredSuccessState extends DeliveredStates {
  late final DeliveredModel deliveredModel;
  DeliveredSuccessState(this.deliveredModel);
}
class DeliveredErrorState extends DeliveredStates {
  late final String error;
  DeliveredErrorState(this.error);}