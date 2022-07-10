import 'package:flutter/material.dart';
import 'package:project/screen/detail_screen.dart';
import 'package:clay_containers/clay_containers.dart';

class ReusableCard extends StatelessWidget {
  String name;
  String url;
  String slug;
  String detail;
  ReusableCard(
      {required this.url,
      required this.name,
      required this.slug,
      required this.detail}) {}

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(slug)),
        );
      },
      child: Container(
        color: Colors.white54.withOpacity(0.5),
        height: 250,
        width: 200,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: Container(height: 150, child: Image.network(url)),
                ),
              ),
              Text(name),
            ],
          ),
        ),

        // ),
      ),
    );
  }
}
