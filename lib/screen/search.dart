import 'package:flutter/material.dart';
import 'package:project/json_data/json_fatch_data.dart';
import 'detail_screen.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  final controller = TextEditingController();

  String name = " ";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          setState(() {});
                          name = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.greenAccent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildExpanded(name),
          ],
        ),
      ),
    );
  }

  Widget buildExpanded(String mobile) {
    if (mobile == " ") {
      return Text(" ");
    } else {
      return Expanded(
        child: FutureBuilder<List<Phones>>(
          future: DataFromAPI.search(mobile),
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
  }

  Widget buildPhones(List<Phones> phones) => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: phones.length,
      itemBuilder: (context, index) {
        final phone = phones[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image(
              image: NetworkImage(phone.image),
            ),
            title: Text(phone.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(phone.slug)),
              );
            },
          ),
        );
      });
}
