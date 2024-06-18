// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int currentTab = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon fir1 = const Icon(
      Icons.villa,
      color: Color(0xff067979),
    );
    Icon fir2 = const Icon(
      Icons.build_outlined,
      color: Color(0xff067979),
    );
    Icon fir3 = const Icon(
      Icons.apple_outlined,
      color: Color(0xff067979),
    );
    Icon fir4 = const Icon(
      Icons.home,
      color: Color(0xff067979),
    );

    int _id = 0;

    void _onItemTapped(int index) {
      setState(() {
        _id = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffefbff),
        toolbarHeight: 100,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width - 120,
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.gps_fixed,
                      size: 20,
                      color: Color(0xff067979),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff747474)),
                      ),
                      Text(
                        "Dubai, United Arab Emira",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff747474)),
                      )
                    ],
                  ),
                ],
              )),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff067979)),
          )
        ]),
      ),
      body: Container(
        color: const Color(0xfffefbff),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.1), width: 1),
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Color(0xff067979),
                            ),
                          ),
                          //color: Colors.blue,
                        ),
                        SizedBox(
                          height: 50,
                          width:
                              MediaQuery.of(context).size.width - 50 - 50 - 60,
                          child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Search your house...",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300))),

                          //color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 7),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 0.5,
                              offset: const Offset(0, 0.5))
                        ],
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.vape_free,
                        color: Color(0xff067979),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: 130,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  color: const Color(0xff067979),
                  borderRadius: BorderRadius.circular(12)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  buttonScrolled(fir1, "villa"),
                  buttonScrolled(fir2, "Penthouse"),
                  buttonScrolled(fir3, "Banglow"),
                  buttonScrolled(fir4, "home"),
                ],
              ),
            ),
            defiledContainer(context),
            defiledContainer(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_sharp),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff067979),
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget buttonScrolled(Icon con, String txt) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 7),
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        con,
        const SizedBox(
          width: 10,
        ),
        Text(
          txt,
          style: const TextStyle(
              fontSize: 17,
              color: Color(0xff747474),
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget defiledContainer(context) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby propreties(Dubai)",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff747474)),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff747474)),
              )
            ]),
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 180,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 178,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 1,
                    ),
                    oneContainer(context),
                    oneContainer(context),
                    oneContainer(context)
                  ],
                ),
              )
            ],
          ))
    ],
  );
}

Widget oneContainer(context) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    width: MediaQuery.of(context).size.width * 0.70,
    height: 178,
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          margin: const EdgeInsets.all(10),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(
            child: Text(
              "Sell",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.villa,
                      color: Color(0xff067979),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Villa",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Luxurious Haven villa",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "\$2500000",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.gps_fixed,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                "789 Beach Road,Dubai, Unite...",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
