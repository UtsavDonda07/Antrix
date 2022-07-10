import 'package:flutter/material.dart';
import 'package:project/screen/search.dart';
import 'screen/home_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentIndex = 0;
  final screen = [HomeScreen(), Search()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("mobile guru"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
        body: IndexedStack(
          index: currentIndex,
          children: screen,
        ),
      ),
    );
  }
}
