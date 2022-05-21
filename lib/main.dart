import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

 //      home: SplashScreenView(
 //        navigateRoute: HomeScreen(),
 //        speed: 1,
 //        duration: 2000,
 //        imageSize: 200,
 //        imageSrc: "assets/splashscreen.jpg",
 //         text: "Ujphone",
 // backgroundColor: Colors.white,
 //
 //      ),
   home: HomeScreen(),
    );
  }
}
