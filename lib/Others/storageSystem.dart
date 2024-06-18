import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MonWidget extends StatefulWidget {
  const MonWidget({super.key});

  @override
  State<MonWidget> createState() => _MonWidgetState();
}

String _text = '';

// Obtenir le chemin du dossier des documents
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

// Créer une référence au fichier file.txt
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/file.txt');
}

// Écrire "bonjour tout le monde" dans le fichier
Future<File> writeData() async {
  final file = await _localFile;
  return file.writeAsString('Comment allez vous ?');
}

// Lire le contenu du fichier
Future<String> readData() async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return 'Erreur: $e';
  }
}

class _MonWidgetState extends State<MonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemple de path_provider'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    writeData();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.read_more),
                  onPressed: () async {
                    String data = await readData();
                    setState(() {
                      _text = data;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _text = '';

  // Obtenir le chemin du dossier des documents
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Créer une référence au fichier file.txt
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/file.txt');
  }

  // Écrire "bonjour tout le monde" dans le fichier
  Future<File> writeData() async {
    final file = await _localFile;
    return file.writeAsString('bonjour tout le monde');
  }

  // Lire le contenu du fichier
  Future<String> readData() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'Erreur: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemple de path_provider'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    //writeData();
                    print("Bonjour tout le monde");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.read_more),
                  onPressed: () {
                    //String data = await readData();
                    setState(() {
                      //_text = data;
                      //_text = transString(favoriteListC);
                      //print(transString(favoriteListC));
                      print("Bonjour tout le monde");
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
