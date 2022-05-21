import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:project/components/reusableCard.dart';
import 'package:project/components/reusableCircle.dart';
import 'package:project/json_data/json_fatch_data.dart';
import 'package:project/screen/detail_screen.dart';

late Future<List<Phones>> function;

class MobileListScreen extends StatefulWidget {
  MobileListScreen(Future<List<Phones>> f) {
    function = f;
  }
  // const MobileListScreen({Key? key}) : super(key: key);

  @override
  State<MobileListScreen> createState() => _MobileListScreenState();
}

class _MobileListScreenState extends State<MobileListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdbe9f7),

      body: FutureBuilder<List<Phones>>(
        future: function,
        builder: (context, snapshot) {
          final phones = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return buildPhones(phones!);
              }
          }
        },
      ),
    );
  }

  Widget buildPhones(List<Phones> phones) => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: phones.length,
        itemBuilder: (context, index) {
          final phone = phones[index];
          print(phone.name);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                  onPressed: () {
                    print(phone.name);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(phone.slug)),
                    );
                    //  navigate to new page
                  },
                  child: Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                  ),
          ),
                    child: ClayContainer(
                      color: Color(0xffe0f1ff).withOpacity(0.5),
                      curveType: CurveType.convex,
                      child: Row(
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child:
                                      Flexible(child: Image.network(phone.image)),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  phone.name,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Container(
                                    // color: Colors.white,
                                    child: Text(
                                      phone.slug,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                                Container(

                                    child: Text(
                                      "Snapdragon 888",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                                Container(

                                    child: Text(
                                      "6000mAh",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                                Container(

                                    child: Text(
                                      "48MP+5MP+2MP+2MP",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                                Container(

                                    child: Text(
                                      "16MP",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),),
            ],
          );
        },
      );
}
