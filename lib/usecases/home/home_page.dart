import 'package:flutter/material.dart';
import 'package:flutter_template/constants/widget_keys.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _urlController = TextEditingController();
  late final Directory docDir;
  List<File> file = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    docDir = await getApplicationDocumentsDirectory();
    Directory imageDir = await Directory(path.join(docDir.path, 'images'))
        .create(recursive: true);
    List<FileSystemEntity> entities = await imageDir.list().toList();
    setState(() {
      file = entities.whereType<File>().toList();
      print(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key(WidgetKeys.homeScaffoldKey),
        appBar: AppBar(
          title: Text(S.of(context).home),
        ),
        body: Column(
          children: [
            file.isEmpty
                ? const Text('empty')
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: file.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Image.file(
                          file[index],
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  ),
            SizedBox(
              height: 100,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(hintText: 'URL'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var response =
                          await http.get(Uri.parse(_urlController.text));
                      File file = File(
                        path.join(docDir.path, 'images',
                            path.basename(_urlController.text)),
                      );
                      print(file);
                      await file.writeAsBytes(response.bodyBytes);
                    },
                    child: const Text('Download'),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
