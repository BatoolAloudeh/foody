// import 'package:app1/Bloc/states/auth/login.dart';
// import 'package:app1/constant/endPoint/endPoints.dart';
// import 'package:app1/models/auth/login.dart';
// import 'package:app1/network/remote/dioHelper.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:device_info_plus/device_info_plus.dart';
//
// class LoginCubit extends Cubit<LoginStates> {
//   LoginCubit() : super(LoginInitialState());
//
//   static LoginCubit get(context) => BlocProvider.of(context);
//   late LoginModel loginModel;
//
//   Future<void> login({
//     required String email,
//     required String password,
//   }) async {
//     emit(LoginLoadingState());
//
//     // Get device key
//     String deviceKey = await _getDeviceKey();
//
//     DioHelper.postData(
//       url: LOGIN,
//       data: {
//         'email': email,
//         'password': password,
//         'device_key': deviceKey,
//       },
//     ).then((value) async {
//       print('deviceKey= ${deviceKey}');
//       print(value.data);
//       loginModel = LoginModel.fromJson(value.data);
//       emit(LoginSuccessState(loginModel));
//     }).catchError((error) {
//       print("Error: ${error.toString()}");
//       emit(LoginErrorState(error.toString()));
//     });
//   }
//
//   Future<String> _getDeviceKey() async {
//     final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     return androidInfo.id ?? 'unknown_device'; // For Android
//   }
// }














import 'package:app1/Bloc/states/auth/login.dart';
import 'package:app1/constant/endPoint/endPoints.dart';
import 'package:app1/models/auth/login.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    // Get device token
    String deviceKey = await _getDeviceToken();

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
        'device_token': deviceKey,
      },
    ).then((value) async {
      print('deviceKey= $deviceKey');
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print("Error: ${error.toString()}");
      emit(LoginErrorState(error.toString()));
    });
  }

  Future<String> _getDeviceToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    return token ?? 'unknown_token';
  }
}
