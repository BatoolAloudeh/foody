import 'package:app1/Bloc/Blocobserver.dart';
import 'package:app1/Bloc/cubit/auth/login.dart';
import 'package:app1/Bloc/cubit/chef/endPreparing.dart';
import 'package:app1/Bloc/cubit/chef/getOrder.dart';
import 'package:app1/Bloc/cubit/chef/startPreparing.dart';
import 'package:app1/Bloc/cubit/waiter/delivered.dart';
import 'package:app1/Bloc/cubit/waiter/getOrder.dart';
import 'package:app1/firebase_options.dart';
import 'package:app1/network/local/cacheHelper.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:app1/screen/auth/boarding.dart';
import 'package:app1/firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this:
String language='english';

//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.brown.shade50,
//         // fontFamily: 'Shantell Sans',
//         appBarTheme: AppBarTheme(),
//       ),
//       themeMode: ThemeMode.dark,
//       debugShowCheckedModeBanner: false,
//       home: BoardingScreen(),
//     );
//   }
// }
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseApi().initNotification();
//   SharedPreferences.getInstance().then((instance) {
//     // language = instance.getString('language')!;
//   });
//
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//   await CacheHelper.init();
//
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => LoginCubit()),
//         BlocProvider(create: (context) => GetOrderChefCubit()),
//         BlocProvider(create: (context) => StartPreparingCubit()),
//         BlocProvider(create: (context) => EndPreparingCubit()),
//         BlocProvider(create: (context) => GetOrderWaiterCubit()),
//         BlocProvider(create: (context) => DeliveredCubit()),
//
//       ],
//       child:MyApp (),
//     ),
//   );
// }




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.brown.shade50,
        appBarTheme: AppBarTheme(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: BoardingScreen(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  SharedPreferences.getInstance().then((instance) {
    // language = instance.getString('language')!;
  });

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => GetOrderChefCubit()),
        BlocProvider(create: (context) => StartPreparingCubit()),
        BlocProvider(create: (context) => EndPreparingCubit()),
        BlocProvider(create: (context) => GetOrderWaiterCubit()),
        BlocProvider(create: (context) => DeliveredCubit()),
      ],
      child: MyApp(),
    ),
  );
}















//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// String language='english';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Firebase Messaging Demo')),
//         body: MessagingWidget(),
//       ),
//     );
//   }
// }
//
// class MessagingWidget extends StatefulWidget {
//   @override
//   _MessagingWidgetState createState() => _MessagingWidgetState();
// }
//
// class _MessagingWidgetState extends State<MessagingWidget> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Message data: ${message.data}');
//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Waiting for messages...'));
//   }
// }











//
// import 'package:app1/firebase.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//     options:  FirebaseOptions(
//     apiKey: 'AIzaSyCcn1_WSc5-Mjag1U_XuxMt3mHdxTy2V14',
//     appId: '1:777272215124:android:4a5ed48b79a1bd30210fc1',
//     messagingSenderId: 'sendid',
//     projectId: 'foody-8429a',
//     storageBucket: 'foody-8429a.appspot.com',
//   )
//
//   );
//
//   await FirebaseA().initNotification();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Firebase Messaging Demo')),
//         body: MessagingWidget(),
//       ),
//     );
//   }
// }
//
// class MessagingWidget extends StatefulWidget {
//   @override
//   _MessagingWidgetState createState() => _MessagingWidgetState();
// }
//
// class _MessagingWidgetState extends State<MessagingWidget> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Message data: ${message.data}');
//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Waiting for messages...',style: TextStyle(color: Colors.red),)
//
//     );
//
//   }
// }


















