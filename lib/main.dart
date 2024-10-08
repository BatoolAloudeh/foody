import 'package:app1/Bloc/Blocobserver.dart';
import 'package:app1/Bloc/cubit/auth/login.dart';
import 'package:app1/Bloc/cubit/chef/endPreparing.dart';
import 'package:app1/Bloc/cubit/chef/getOrder.dart';
import 'package:app1/Bloc/cubit/chef/startPreparing.dart';
import 'package:app1/Bloc/cubit/waiter/delivered.dart';
import 'package:app1/Bloc/cubit/waiter/getOrder.dart';
import 'package:app1/constant/ui/screen_constant.dart';
import 'package:app1/firebase_options.dart';
import 'package:app1/network/local/cacheHelper.dart';
import 'package:app1/network/remote/dioHelper.dart';
import 'package:app1/screen/auth/boarding.dart';
import 'package:app1/firebase.dart';
import 'package:app1/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


String language='english';



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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: greenColor1,
          selectionColor: whiteColor,
          selectionHandleColor: greenColor1,
        ),
        scaffoldBackgroundColor: Colors.brown.shade50,
        appBarTheme: AppBarTheme(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: BoardingScreen(),
    );
  }
}
