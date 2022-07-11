import 'package:flutter/material.dart';
import '../json_data/json_fatch_data.dart';
import '../screen/mobile_list_screen.dart';

class ReusableCircle extends StatelessWidget {
  final String name;
  final String slug;
  ReusableCircle(this.name, this.slug);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
        child: MaterialButton(
          // minWidth: 0,
          // height: 0,
           padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MobileListScreen(DataFromAPI.getPhonesData(slug))),
            );
          },
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xff2196f3),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,

                ),
              ),
            )),
          ),
        ),

    );
  }
}
// Container(
// height: 80,
// width: 80,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(40)),
// child: Center(
// child: Text(
// name,
// style: const TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// )),
// ),