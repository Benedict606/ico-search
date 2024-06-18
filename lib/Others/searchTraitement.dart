// ignore_for_file: camel_case_types

import 'package:election_time/Others/acc.dart';
import 'package:election_time/Others/datas.dart';
import 'package:flutter/material.dart';

List<String> tampoListe = [];
List<int> tampoInt = [];

class iconsDatasZ {
  List<String> nameIcone;
  List<Icon> iconDat;
  List<int> monInt;
  iconsDatasZ(this.nameIcone, this.iconDat, this.monInt);
}

iconsDatasZ refreshListe(String searchWord) {
  List<int> tampoInt = [];
  List<Icon> tampoListe = [];
  List<String> nameIcon = [];
  int j = 0;
  while (j < listeString.length) {
    if (listeString[j].contains(searchWord)) {
      tampoInt.add(j);
    }
    j++;
  }

  int i = 0;
  while (i < tampoInt.length) {
    tampoListe.add(IconsDoc1[tampoInt[i]]);
    nameIcon.add(listeString[tampoInt[i]]);
    i++;
  }

  iconsDatasZ meDocs = iconsDatasZ(nameIcon, tampoListe, tampoInt);

  return meDocs;
}

List<String> searchReload(String searchWord, List<String> myList) {
  List<int> tampoInt = [];
  List<String> nameIcon = [];
  int j = 0;
  while (j < myList.length) {
    if (listeString[j].contains(searchWord)) {
      tampoInt.add(j);
    }
    j++;
  }
  int i = 0;
  while (i < tampoInt.length) {
    nameIcon.add(listeString[tampoInt[i]]);
    i++;
  }
  return nameIcon;
}

List<int> favoriList = [];

String routeNumber = "1";
