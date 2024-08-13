
import 'package:app1/Bloc/cubit/auth/login.dart';
import 'package:app1/Bloc/states/auth/login.dart';
import 'package:app1/constant/constantKey/key.dart';
import 'package:app1/constant/ui/screen_constant.dart';
import 'package:app1/network/local/cacheHelper.dart';
import 'package:app1/screen/chef.dart';
import 'package:app1/screen/waiter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/ui/language.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool password = true;

  Language _language = Language();
  List<String> _languages = ['Arabic', 'English'];
  String? selectedLlanguage;

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.accessToken != null) {
              CacheHelper.saveData(
                key: TOKENKEY,
                value: state.loginModel.accessToken,
              ).then((value) {});
              print('success');
              if (state.loginModel.user?.userType == 1) {
                navigateTo(context, WaiterOrdersScreen());
              } else {
                navigateTo(context, ChefOrdersScreen());
              }
            }
          }
          if (state is LoginErrorState) {
            print('error');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: Color(0xFFE9f5DB).withOpacity(0.3),
            body: defaultContainerAppbar(
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            _language.WelcomeBack(),
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Satisfy-Regular',
                              color: greenColor2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 35),
                          child: Text(
                            _language.explore(),
                            style: TextStyle(
                              color: greenColor1,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: defaultFormField(
                            keyboardtype: TextInputType.emailAddress,
                            text: _language.email(),
                            prefix: Icons.email,
                            controller: emailController,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return _language.Noemail();
                              } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Invalid email format';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: defaultFormField(
                            keyboardtype: TextInputType.visiblePassword,
                            text: _language.password(),
                            prefix: Icons.lock,
                            controller: passwordController,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return _language.Nopassword();
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            isPassword: password,
                            suffix: password ? Icons.visibility_off : Icons.visibility,
                            suffixButton: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            onChanged: (value) {},
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: state is! LoginLoadingState
                              ? defaultButton(
                            sizewidth: 120,
                            text: _language.Login(),
                            suffix: Icons.navigate_next,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          )
                              : Center(
                            child: CircularProgressIndicator(
                              color: greenColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
