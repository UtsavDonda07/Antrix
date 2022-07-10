import 'package:flutter/material.dart';
import 'package:project/json_data/function_screen.dart';
import 'package:project/json_data/json_fatch_data.dart';
import 'package:project/screen/brand_list_screen.dart';
import 'package:project/screen/mobile_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FF),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 20, 10, 10),
                    child: Text(
                      "Brand",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:
                    Container(height: 120, child: MyFunction.showBrandList()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 0,
                    height: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BrandListScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xffc3c5f5),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Text(
                      "Latest",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Container(
                    height: 300,
                    child: MyFunction.showPhones(DataFromAPI.getLatestPhone())),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 0,
                    height: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MobileListScreen(DataFromAPI.getLatestPhone())),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xffc3c5f5),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                    child: Text(
                      "Top Interested",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Container(
                    height: 300,
                    child:
                        MyFunction.showPhones(DataFromAPI.getTopByInterest())),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 0,
                    height: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MobileListScreen(
                                DataFromAPI.getTopByInterest())),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xffc3c5f5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
