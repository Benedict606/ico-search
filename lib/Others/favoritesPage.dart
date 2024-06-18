// ignore_for_file: non_constant_identifier_names
import 'package:election_time/Others/acc.dart';
import 'package:election_time/Others/datas.dart';
import 'package:election_time/Others/searchTraitement.dart';
import 'package:flutter/material.dart';

class FavoritesIcones extends StatefulWidget {
  const FavoritesIcones({super.key});

  @override
  State<FavoritesIcones> createState() => _FavoritesIconesState();
}

class _FavoritesIconesState extends State<FavoritesIcones> {
  List<int> NumberCode = [];

  @override
  void initState() {
    super.initState();
    NumberCode = favoriList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 15),
                    child: IconButton(
                      onPressed: () {
                        var route = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const IconsDatas());
                        Navigator.of(context).push(route);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 27,
                      ),
                    )),
                const Text("Favorite Icons"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.favorite_sharp,
                size: 27,
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: NumberCode.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: listToop(context, IconsDoc1[NumberCode[index]],
                listeString[NumberCode[index]], index.toString()),
            onTap: () {
              routeNumber = NumberCode[index].toString();
              if (favoriList.contains(NumberCode[index])) {
                like = 1;
              } else {
                like = 0;
              }
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => const BigView1());
              Navigator.of(context).push(route);
            },
          );
        },
      ),
    );
  }
}
