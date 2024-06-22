import 'package:app1/models/auth/login.dart';

abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  late final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates {
  late final String error;
  LoginErrorState(this.error);
}