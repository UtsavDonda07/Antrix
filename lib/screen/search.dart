import 'package:flutter/material.dart';
import 'package:project/json_data/json_fatch_data.dart';
import 'detail_screen.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  bool clear = false;
  String name = " ";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FF),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 200,
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
                          suffixIcon: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  controller.clear();
                                  clear = true;
                                });
                              },
                              child: const Icon(Icons.clear)),
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.black),
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
      return Expanded(child: Image.asset("assets/search.png"));
    } else {
      return Expanded(
        child: Container(
          height: 2000,
          child: FutureBuilder<List<Phones>>(
            future: DataFromAPI.search(mobile),
            builder: (context, snapshot) {
              final phones = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return const Center(child: Text("Not Found"));
                  } else {
                    return buildPhones(phones!);
                  }
              }
            },
          ),
        ),
      );
    }
  }

  Widget buildPhones(List<Phones> phones) => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: phones.length,
      itemBuilder: (context, index) {
        final phone = phones[index];
        if (clear == true) {
          clear = false;
          return Expanded(child: Image.asset("assets/search.png"));
        } else {
          return Padding(
            padding: const EdgeInsets.all(10.0),
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
        }
      });
}
