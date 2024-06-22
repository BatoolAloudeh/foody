import 'package:app1/models/chef/endPreparing.dart';


abstract class EndPreparingStates {}
class EndPreparingInitialState extends EndPreparingStates{}
class EndPreparingLoadingState extends EndPreparingStates {}
class EndPreparingSuccessState extends EndPreparingStates {
  late final EndPreparingModel endPreparingModel;
  EndPreparingSuccessState(this.endPreparingModel);
}
class EndPreparingErrorState extends EndPreparingStates {
  late final String error;
  EndPreparingErrorState(this.error);}