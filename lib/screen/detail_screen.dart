import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project/components/detail%20table.dart';
import 'package:project/json_data/json_fatch_data.dart';

late String slug;

class DetailScreen extends StatefulWidget {
  DetailScreen(String s) {
    slug = s;
    print(slug);
  }
  // const DetailScreen({Key? key}) : super(key: key);
  //
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffdbe9f7),

      body: FutureBuilder<List<String>>(
        future: DataFromAPI.getPhoneSpecification(slug),
        builder: (context, snapshot) {
          final details = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return buildPhones(details!);
              }
          }
        },
      ),
    );
  }

  buildPhones(List<String> details) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/background.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 30,
                child: Text(
                  "${details[0]} ${details[1]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
                child: Divider(

                ),
              ),

              ClayContainer(
                curveType: CurveType.convex,
                child: Image.network(details[2]),
              ),
              SizedBox(
                height: 40,
                child: Divider(
                  color: Colors.blueGrey,
                  height: 10,
                  thickness: 1.5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Size Name: ${details[7]}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Price: ₹",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          " ${details[23]}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
               ),
              SizedBox(
                height: 30,
                child: Divider(
    color: Colors.blueGrey,
                  height: 20,
                  thickness: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Modal Name : ",
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        Text(
                          details[1],
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Brand : ",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        Text(
                          details[0],
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "OS : ",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        Text(
                          details[6],
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors : ",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        Flexible(
                            child: Text(
                          details[13],
                          style: TextStyle(fontSize: 17),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        const Flexible(
                            child: Text(
                          "Cellular :",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        )),
                        Flexible(
                          child: Text(
                            details[14],
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Text(
                          "Release Date : ",
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        )),
                        Text(
                          details[4],
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: Divider(
                  color: Colors.blueGrey,
                  height: 20,
                  thickness: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Features & details",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),

                    TableTile(title:"Rear Camera",data:details[8].toString()),
                    TableTile(title:"Selfie  Camera",data:details[9].toString()),
                    TableTile(title:"Bettery",data:details[10].toString()),

                    TableTile(title:"Processor",data:details[11].toString()),
                    TableTile(title:"Weight",data:details[5].toString()),
                    TableTile(title:"Memory Storage",data:details[7].toString()),
                    TableTile(title:"Display",data:details[12].toString()),
                    TableTile(title:"Speaker",data:details[16].toString()),
                    TableTile(title:"3.5mm jack",data:details[17].toString()),
                    TableTile(title:"Sensors",data:details[15].toString()),

                    TableTile(title:"Bluetooth",data:details[18].toString()),
                    TableTile(title:"GPS",data:details[19].toString()),
                    TableTile(title:"NFC",data:details[20].toString()),
                    TableTile(title:"Radio",data:details[21].toString()),
                    TableTile(title:"USB",data:details[22].toString()),
              // TableTile(title:"charging",data:details[23].toString()),   //error given
                   ],
               ),
              ),
            ],
          ),
        ),
  );
}
