import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required String text,
  required IconData prefix,
  Function? onPressed,
  required TextEditingController controller,
  required TextInputType? keyboardtype,
  required String? Function(String?) validate,
  IconData? suffix,
  String? initialValue,
  void Function(String)? onChanged,
  Function? suffixButton,
  required void Function() onTap,
  bool isPassword = false,
  void Function(String)? onsubmitted,
  void Function(String?)? onSaved,
  double width = double.infinity,
  double height = 45,
}) =>
    Container(
      height: height,
      width: width,
      child: TextFormField(
        onSaved:onSaved ,
        initialValue:initialValue ,
        cursorColor: greenColor2,
        keyboardType: keyboardtype,
        onChanged: onChanged,
        onTap: onTap,
        onFieldSubmitted: onsubmitted,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: greenColor1),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(color: whiteColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(color: whiteColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(color: whiteColor)),
          border: const OutlineInputBorder(),
          prefixIcon: Icon(
            prefix,
            color: greenColor2,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixButton!();
                  },
                  icon: Icon(
                    suffix,
                    color: greenColor2,
                  ),
                  highlightColor: GWColor,
                  hoverColor: GWColor,
                )
              : null,
        ),
        controller: controller,
        validator: validate,
        obscureText: isPassword,
      ),
    );

Widget defaultButton({
  required String text,
  required Function onPressed,
  double? fontSize = 20.0,
  Color background = Colors.brown,
  bool loading = false,
  double width = double.infinity,
  double sizewidth = 40,
  double radius = 100.0,
  double height = 45,
  IconData? suffix,
}) =>
    Container(
      width: width,
      height: height,
      child: Container(
        width: 300,
        height: 100,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [


              greenColor2,
              greenColor2,
              greenColor1,
              greenColor1,
              greenColor1,



            ],
          ),
        ),
        child: MaterialButton(
          padding: EdgeInsetsDirectional.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          // color: Colors.blueGrey[500],
          onPressed: () {
            onPressed();
          },
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );


Widget defaultContainerAppbar(
    {Widget? child,
      double height = 2000,
      double width = double.infinity}) =>
    Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Images/ff.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.1),
                ),
                child: child,
              ),
            ),
          ),
        ));


//Navigate:

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void navigateBack(context) => Navigator.pop(context);


//Colors:

Color greenColor2 =Color(0xFF1b2727);
Color greenColor1 =Color(0xFF3C5148);
Color greenColor =Color(0xFF3C5153);
Color whiteColor =Colors.white ;
Color GWColor = Color(0xFFB2C5B2) ;



