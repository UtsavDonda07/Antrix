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
List<String> detail = [];
class MobileListScreen extends StatefulWidget {
  MobileListScreen(Future<List<Phones>> f) {
    function = f;
  }
  // const MobileListScreen({Key? key}) : super(key: key);

  @override
  State<MobileListScreen> createState() => _MobileListScreenState();
}

class _MobileListScreenState extends State<MobileListScreen> {
  static Future<List<String>> getPhoneSpec(phone) async {

    var jsonData = await fetch_data
        .call_api("https://api-mobilespecs.azharimm.site/v2/" + phone);
    var data = jsonData['data'];

    detail.add(jsonData['data']['storage']); //0
    detail.add(jsonData['data']['specifications'][11]['specs'][0]['val']
    [0]); //1 battery
    detail.add(jsonData['data']['specifications'][4]['specs'][1]['val']
    [0]); //2 processor
    detail.add(
        jsonData['data']['specifications'][6]['specs'][0]['val'][0]); //3 camera
    detail.add(jsonData['data']['specifications'][7]['specs'][0]['val']
    [0]); //4 front camera


    return detail;
  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8FF),
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
         getPhoneSpec(phone.slug);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(phone.slug)),
                  );
                  //  navigate to new page
                },
                child: Container(
                  color: Colors.white54.withOpacity(0.5),
                  child: Row(
                    children: [
                      Column(
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
                            // Container(
                            //     // color: Colors.white,
                            //     child: Text(
                            //   phone.slug,
                            //   style:
                            //       TextStyle(color: Colors.grey, fontSize: 12),
                            // )),
                            // Container(
                            //     child: Text(
                            //   detail.first,
                            //   style:
                            //       TextStyle(color: Colors.grey, fontSize: 12),
                            // )),
                            // Container(
                            //     child: Text(
                            //  detail[2],
                            //   style:
                            //       TextStyle(color: Colors.grey, fontSize: 12),
                            // )),
                            // Container(
                            //     child: Text(
                            //   detail[3],
                            //   style:
                            //       TextStyle(color: Colors.grey, fontSize: 12),
                            // )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
}
