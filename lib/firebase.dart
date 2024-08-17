
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void>handleBackgroundMessage(RemoteMessage message)async{
print('Title: ${message.notification?.title}');
print('Body: ${message.notification?.body}');
print('bayload: ${message.data}');
}


class FirebaseApi {
  final firebasem = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await firebasem.requestPermission();
    final fcmToken = await firebasem.getToken();
    print("Token=$fcmToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}