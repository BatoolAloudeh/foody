import 'package:app1/models/chef/startPreparing.dart';

abstract class StartPreparingStates {}
class StartPreparingInitialState extends StartPreparingStates{}
class StartPreparingLoadingState extends StartPreparingStates {}
class StartPreparingSuccessState extends StartPreparingStates {
  late final StartPreparingModel startPreparingModel;
  StartPreparingSuccessState(this.startPreparingModel);
}
class StartPreparingErrorState extends StartPreparingStates {
  late final String error;
  StartPreparingErrorState(this.error);}