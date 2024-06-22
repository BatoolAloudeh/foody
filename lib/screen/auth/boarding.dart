// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Boarding extends StatefulWidget {
//   const Boarding({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return BoardingState();
//   }
// }
//
// class BoardingState extends State<Boarding> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/Images/rest.jpg'),
//               fit: BoxFit.cover)),
//       child: Container(
//         height: 1000,
//         width: double.infinity,
//       ),
//
//     ),
//
//     );
//   }
// }
import 'package:app1/constant/ui/screen_constant.dart';
import 'package:app1/screen/auth/login.dart';
import 'package:flutter/material.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BoardingState();
  }
}

class BoardingState extends State<Boarding> {
  final double opacity = 0.5;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:Color(0xFF3c5148).withOpacity(0.7)
,    body:
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/ff.jpg'),
                fit: BoxFit.cover,
              ),

            ),

//
          ),

    Positioned(
      bottom: 50,
        left: 10,
        child:
          IconButton(
              onPressed: () {
                navigateTo(context, Login());
              },
              icon: Icon(
                Icons.arrow_circle_right_rounded,
                size: 60,
                color: greenColor2,
              )),),
        ],

      ),
    );
  }
}
