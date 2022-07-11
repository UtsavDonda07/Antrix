import 'package:flutter/material.dart';
import 'package:project/json_data/json_fatch_data.dart';
import 'mobile_list_screen.dart';

class BrandListScreen extends StatefulWidget {
  const BrandListScreen({Key? key}) : super(key: key);
  static String id = "BrandListScreen";
  @override
  State<BrandListScreen> createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF8F8FF),
      body: FutureBuilder<List<Brands>>(
        future: DataFromAPI.getBrandData(),
        builder: (context, snapshot) {
          final brands = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(child: Text("error"));
              } else {
                return buildBrands(brands!);
              }
          }
        },
      ),
    );
  }

  Widget buildBrands(List<Brands> brands) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        scrollDirection: Axis.vertical,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MobileListScreen(
                          DataFromAPI.getPhonesData(brand.slug))),
                );
                //  navigate to new page
              },
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xff2196f3),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      brand.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
                )
              ));
        },
      );
}
