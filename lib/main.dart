
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calc_1/BottomNavigtion.dart';
import 'package:calc_1/Navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget { 
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen.withScreenFunction(
        splash: Image.asset('assets/launch_image.png'), 
        screenFunction: () async{
          return BottomNavigation();
        },
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Color(0xfffd6b09),
        )
    );
  }
}

// AnimatedSplashScreen(
//         splash: Image.asset('assets/launch_image.png'),
//         nextScreen: Navigation(),
//         splashTransition: SplashTransition.fadeTransition,
//         backgroundColor: Colors.orange, 
//       ),