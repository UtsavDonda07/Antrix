import 'package:flutter/material.dart';

class TableTile extends StatelessWidget {
  String title;
  String data;
  TableTile({required this.title, required this.data});
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Row(
            children: [
              Flexible(
                child: Text(
                  "$title  :      ",
                  style: const TextStyle(fontSize: 17,color: Colors.grey),
                ),
              ),

              Flexible(
                child: Text(
                 data,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ]
        ),
        const SizedBox(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
