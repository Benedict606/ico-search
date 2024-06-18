// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:election_time/Others/datas.dart';
import 'package:election_time/Others/datasC.dart';
import 'package:election_time/Others/favoritesPage.dart';
import 'package:election_time/Others/searchPage.dart';
import 'package:election_time/Others/searchTraitement.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get getLocalPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get getlocalFile async {
  final path = await getLocalPath;
  return File('$path/favorite.txt');
}

Future<File> writeInList(String data) async {
  final file = await getlocalFile;
  return file.writeAsString(data);
}

Future<String> readInList() async {
  try {
    final file = await getlocalFile;
    String datas = await file.readAsString();
    return datas;
  } catch (e) {
    return 'Erreur : $e';
  }
}

//Données à utiliser dans l'app

List<int> favoriteListC = [2, 3, 3, 5, 6, 8];

String transString(List<int> x) {
  String y = "";

  for (int i = 0; i < x.length; i++) {
    y = "$y${x[i]} ";
  }
  return y;
}

String resume = transString(favoriteListC);

List<int> transInt(String x) {
  List<int> numbur = [];
  List<String> chaine = x.split(" ");
  chaine.remove("");
  for (int i = 0; i < chaine.length; i++) {
    numbur.add(int.parse(chaine[i]));
  }

  return numbur;
}

class IconsDatas extends StatefulWidget {
  const IconsDatas({super.key});

  @override
  State<IconsDatas> createState() => _IconsDatasState();
}

class _IconsDatasState extends State<IconsDatas> {
  Icon bloc = Icon(
    Icons.home,
    size: 40,
    color: Colors.black.withOpacity(0.5),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Icons Generator"),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      var route = MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SearchPage());
                      Navigator.of(context).push(route);
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 27,
                    )),
                IconButton(
                    onPressed: () async {
                      favoriList = transInt(await readInList());
                      var route = MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const FavoritesIcones());
                      Navigator.of(context).push(route);
                    },
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                      size: 25,
                    )),
              ],
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 8820,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: listToop(context, IconsDoc1[index], listeString[index],
                index.toString()),
            onTap: () {
              routeNumber = index.toString();
              if (favoriList.contains(index)) {
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

Widget listToop(context, Icon icone0, String textM, String numb) {
  String meSmall(String x) {
    if (x.length > 30) {
      return "${x.substring(0, 29)}...";
    } else {
      return x;
    }
  }

  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
    width: MediaQuery.of(context).size.width - 10,
    height: 70,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: const Offset(1, 1),
        blurRadius: 2,
      ),
    ]),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0.5, 0.5),
                  blurRadius: 0.5,
                ),
              ]),
          child: Center(child: icone0),
        ),
        SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 2),
                child: Text(numb),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 6),
                child: Text(
                  meSmall(textM),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class BigValue extends StatelessWidget {
  final String numbo;
  const BigValue({super.key, required this.numbo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon View"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.width - 50,
              decoration: const BoxDecoration(
                  //color: Colors.white,
                  // borderRadius: BorderRadius.circular(12),
                  //boxShadow: [
                  //BoxShadow(
                  //color: Colors.black.withOpacity(0.1),
                  //offset: const Offset(0.5, 0.5),
                  //blurRadius: 0.5,
                  //),
                  //]
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1))),
              child: Center(child: IconsDoc2[int.parse(numbo)]),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "N° : $numbo",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      ),
                    ),
                    const Text(
                      "Icon name : ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      listeString[int.parse(numbo)],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

int like = 0;

class BigView extends StatefulWidget {
  const BigView({super.key});

  @override
  State<BigView> createState() => _BigViewState();
}

class _BigViewState extends State<BigView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon View"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.width - 50,
              decoration: const BoxDecoration(
                  //color: Colors.white,
                  // borderRadius: BorderRadius.circular(12),
                  //boxShadow: [
                  //BoxShadow(
                  //color: Colors.black.withOpacity(0.1),
                  //offset: const Offset(0.5, 0.5),
                  //blurRadius: 0.5,
                  //),
                  //]
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1))),
              child: Center(child: IconsDoc2[int.parse(routeNumber)]),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      //width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "N° : $routeNumber",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: IconButton(
                                onPressed: () async {
                                  setState(() {
                                    if (like == 0) {
                                      like = 1;
                                      favoriList.add(int.parse(routeNumber));
                                      writeInList(transString(favoriList));
                                    } else {
                                      like = 0;
                                      favoriList.remove(int.parse(routeNumber));
                                      writeInList(transString(favoriList));
                                    }
                                  });
                                  favoriList = transInt(await readInList());
                                },
                                icon: like == 0
                                    ? const Icon(
                                        Icons.favorite_outline,
                                        size: 30,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.favorite_sharp,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                              )),
                        ],
                      ),
                    ),
                    const Text(
                      "Icon name : ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      listeString[int.parse(routeNumber)],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class BigView1 extends StatefulWidget {
  const BigView1({super.key});

  @override
  State<BigView1> createState() => _BigView1State();
}

class _BigView1State extends State<BigView1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon View"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.width - 50,
              decoration: const BoxDecoration(
                  //color: Colors.white,
                  // borderRadius: BorderRadius.circular(12),
                  //boxShadow: [
                  //BoxShadow(
                  //color: Colors.black.withOpacity(0.1),
                  //offset: const Offset(0.5, 0.5),
                  //blurRadius: 0.5,
                  //),
                  //]
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1))),
              child: Center(child: IconsDoc2[int.parse(routeNumber)]),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "N° : $routeNumber",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (like == 0) {
                                      like = 1;
                                      favoriList.add(int.parse(routeNumber));
                                      writeInList(transString(favoriList));
                                    } else {
                                      like = 0;
                                      favoriList.remove(int.parse(routeNumber));
                                      writeInList(transString(favoriList));
                                      var route = MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const FavoritesIcones());
                                      Navigator.of(context).push(route);
                                    }
                                  });
                                },
                                icon: like == 0
                                    ? const Icon(
                                        Icons.favorite_outline,
                                        size: 30,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.favorite_sharp,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                              )),
                        ],
                      ),
                    ),
                    const Text(
                      "Icon name : ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      listeString[int.parse(routeNumber)],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

// =================== CERTAINS ELEMETS DU CODE ++++++


