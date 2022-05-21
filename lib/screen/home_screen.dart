import 'package:flutter/material.dart';
import 'package:project/json_data/function_screen.dart';
import 'package:project/json_data/json_fatch_data.dart';
import 'package:project/screen/brand_list_screen.dart';
import 'package:project/screen/mobile_list_screen.dart';
import 'package:project/screen/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxScrolled) => [
                    SliverAppBar(
                      flexibleSpace: Image(
                        image: AssetImage("assets/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        "Ujphone",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      floating: true,
                      snap: true,
                      pinned: true,
                      expandedHeight: 130.0,
                      centerTitle: true,
                      bottom: TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(Icons.home,
                                color: Colors.lightGreenAccent),
                            text: 'Home',
                          ),
                          Tab(
                            icon: Icon(Icons.search,
                                color: Colors.lightGreenAccent),
                            text: 'Search',
                          ),
                        ],
                      ),
                    ),
                  ],
              body: TabBarView(
                children: [Home(), Search()],
              )),
        ),
      );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(height: 120, child: MyFunction.showBrandList()),
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
                  child: Icon(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  child: Icon(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                  height: 300,
                  child: MyFunction.showPhones(DataFromAPI.getTopByInterest())),
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
                              MobileListScreen(DataFromAPI.getTopByInterest())),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(0xffc3c5f5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
