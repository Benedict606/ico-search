// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:election_time/Others/acc.dart';
import 'package:election_time/Others/searchTraitement.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController searchvalue = TextEditingController();
String wordEnter = "";
int numbert = 0;

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wordEnter = "";
    numbert = 0;
    searchvalue.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search (${numbert})",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(1, 1),
                      blurRadius: 0.3,
                      spreadRadius: 0.3,
                    )
                  ]),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      size: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width - 50 - 50 - 60,
                      child: TextField(
                          controller: searchvalue,
                          onChanged: (value) {
                            setState(() {
                              wordEnter = value;
                              numbert =
                                  refreshListe(wordEnter).nameIcone.length;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Tap your icon name...",
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300))),

                      //color: Colors.green,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: refreshListe(wordEnter).nameIcone.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: listToop(context, refreshListe(wordEnter).iconDat[index],
                refreshListe(wordEnter).nameIcone[index], index.toString()),
            onTap: () {
              routeNumber = refreshListe(wordEnter).monInt[index].toString();
              if (favoriList.contains(refreshListe(wordEnter).monInt[index])) {
                like = 1;
              } else {
                like = 0;
              }

              var route = MaterialPageRoute(
                  builder: (BuildContext context) => const BigView());
              Navigator.of(context).push(route);
            },
          );
        },
      ),
    );
  }
}
