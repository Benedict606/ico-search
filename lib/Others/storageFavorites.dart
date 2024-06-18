import 'dart:io';
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
