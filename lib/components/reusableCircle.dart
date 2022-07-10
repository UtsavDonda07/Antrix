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
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 0,
        height: 0,
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MobileListScreen(DataFromAPI.getPhonesData(slug))),
          );
        },
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: const Color(0xffc3c5f5), borderRadius: BorderRadius.circular(40)),
          child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      ),
    );
  }
}
