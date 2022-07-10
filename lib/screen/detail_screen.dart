import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/components/detail%20table.dart';
import 'package:project/json_data/json_fatch_data.dart';

late String slug;

class DetailScreen extends StatefulWidget {
  DetailScreen(String s) {
    slug = s;
  }

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FF),
      body: FutureBuilder<List<String>>(
        future: DataFromAPI.getPhoneSpecification(slug),
        builder: (context, snapshot) {
          final details = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
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

  buildPhones(List<String> details) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 30,
              child: Text(
                "${details[0]} ${details[1]}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
              child: Divider(),
            ),
            Container(
              child: Image.network(details[2]),
            ),
            const SizedBox(
              height: 30,
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
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Price: ₹",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "    ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Colors.blueGrey,
                height: 20,
                thickness: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Details",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Modal Name   :    ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Text(
                        details[1],
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Brand               :     ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Text(
                        details[0],
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "OS                    :     ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Flexible(
                        child: Text(
                          details[6],
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Colors              :     ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Flexible(
                          child: Text(
                        details[13],
                        style: const TextStyle(fontSize: 17),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      const Flexible(
                          child: Text(
                        "Cellular            :     ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      )),
                      Flexible(
                        child: Text(
                          details[14],
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Flexible(
                          child: Text(
                        "Release Date  :  ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      )),
                      Text(
                        details[4],
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
              child: Divider(
                color: Colors.blueGrey,
                height: 20,
                thickness: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Features & details",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  TableTile(
                      title: "Rear Camera   ", data: details[8].toString()),
                  TableTile(
                      title: "Selfie Camera ", data: details[9].toString()),
                  TableTile(
                      title: "Bettery             ",
                      data: details[10].toString()),
                  TableTile(
                      title: "Processor        ", data: details[11].toString()),
                  TableTile(
                      title: "Weight              ",
                      data: details[5].toString()),
                  TableTile(
                      title: "Storage             ",
                      data: details[7].toString()),
                  TableTile(
                      title: "Display              ",
                      data: details[12].toString()),
                  TableTile(
                      title: "Speaker             ",
                      data: details[16].toString()),
                  TableTile(
                      title: "3.5mm jack       ", data: details[17].toString()),
                  TableTile(
                      title: "Sensors              ",
                      data: details[15].toString()),
                  TableTile(
                      title: "Bluetooth           ",
                      data: details[18].toString()),
                  TableTile(
                      title: "GPS                     ",
                      data: details[19].toString()),
                  TableTile(
                      title: "NFC                     ",
                      data: details[20].toString()),
                  TableTile(
                      title: "Radio                  ",
                      data: details[21].toString()),
                  TableTile(
                      title: "USB                     ",
                      data: details[22].toString()),
                ],
              ),
            ),
          ],
        ),
      );
}
