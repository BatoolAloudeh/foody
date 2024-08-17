import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app1/constant/ui/screen_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';import '../../constant/constantKey/key.dart';


import '../../constant/ui/language.dart';
import '../../network/local/cacheHelper.dart';
import 'login.dart';

class Logout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogoutState();
  }
}

class LogoutState extends State<Logout> {
  Language _language = Language();
  List<String> _languages = ['Arabic', 'English'];
  String? selectedLlanguage;

  @override
  void initState() {
    super.initState();
    _initLanguage();
  }

  void _initLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? savedLanguage = pref.getString('language');

    if (savedLanguage != null) {
      _language.setLang(savedLanguage);
      setState(() {
        selectedLlanguage = savedLanguage;
      });
    }
  }

  void _logout() async {
    await CacheHelper.deleteData(key: TOKENKEY);
    print('TOKENKEY=$TOKENKEY');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: defaultContainerAppbar(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(
                      color: greenColor1,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25),
                  defaultButton(
                    width: 250,
                    text: 'Logout',
                    suffix: Icons.logout,
                    onPressed: _logout,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
