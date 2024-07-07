// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class Boarding extends StatefulWidget {
// //   const Boarding({super.key});
// //
// //   @override
// //   State<StatefulWidget> createState() {
// //     return BoardingState();
// //   }
// // }
// //
// // class BoardingState extends State<Boarding> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Container(
// //       decoration: BoxDecoration(
// //           image: DecorationImage(
// //               image: AssetImage('assets/Images/rest.jpg'),
// //               fit: BoxFit.cover)),
// //       child: Container(
// //         height: 1000,
// //         width: double.infinity,
// //       ),
// //
// //     ),
// //
// //     );
// //   }
// // }
// import 'package:app1/constant/ui/screen_constant.dart';
// import 'package:app1/screen/auth/login.dart';
// import 'package:flutter/material.dart';
//
// class Boarding extends StatefulWidget {
//   const Boarding({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return BoardingState();
//   }
// }
//
// class BoardingState extends State<Boarding> {
//   final double opacity = 0.5;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       backgroundColor:Color(0xFF3c5148).withOpacity(0.7)
// ,    body:
//       Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/Images/ff.jpg'),
//                 fit: BoxFit.cover,
//               ),
//
//             ),
//
// //
//           ),
//
//     Positioned(
//       bottom: 50,
//         left: 10,
//         child:
//           IconButton(
//               onPressed: () {
//                 navigateTo(context, Login());
//               },
//               icon: Icon(
//                 Icons.arrow_circle_right_rounded,
//                 size: 60,
//                 color: greenColor2,
//               )),),
//         ],
//
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';
import 'package:app1/constant/ui/screen_constant.dart';
import 'package:app1/screen/auth/login.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    // We wait for three minutes before showing the shading and text
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showOverlay = true;
      });
    });
    // We wait for an additional five seconds before going to the login screen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/ff.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark shading
          AnimatedOpacity(
            opacity: _showOverlay ? 1.0 : 0.0,
            duration: Duration(seconds: 2),
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Our App',
                        style: TextStyle(
                          color: whiteColor.withOpacity(0.5),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily:'Satisfy',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),

                      Text(
                        'Explore the app to discover more amazing features!',
                        style: TextStyle(
                          color: whiteColor.withOpacity(0.5),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}