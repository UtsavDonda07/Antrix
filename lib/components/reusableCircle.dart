import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import '../json_data/json_fatch_data.dart';
import '../screen/mobile_list_screen.dart';

class ReusableCircle extends StatelessWidget {
  final String name;
  final String slug;
  ReusableCircle(this.name,this.slug);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 0,
        height: 0,
        padding: EdgeInsets.zero,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MobileListScreen(DataFromAPI.getPhonesData(slug))),
          );
        },
        child: ClayContainer(
          // depth: 100,
          color: Color(0xffd1e3bc),
          curveType: CurveType.convex,
          // spread: 40,
          height: 90,
          width: 85,
          borderRadius: 50,
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
