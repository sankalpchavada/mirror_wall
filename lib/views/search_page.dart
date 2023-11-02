import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mirror_wall/model/web_model.dart';

import 'package:mirror_wall/views/search_web.dart';
import 'package:provider/provider.dart';

import '../providers/web_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var browserlist = Provider.of<WebProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Browser",
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                  'https://freepngimg.com/download/google/155871-logo-official-google-free-transparent-image-hq.png'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('parse done ${searchController.text}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Searchpage(),
                          settings:
                              RouteSettings(arguments: searchController.text)),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search),
                      Text("Search"),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
//
// Expanded(
// flex: 2,
// child: GridView(
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// ),
// children: browserlist.BrowserList.map(
// (e) => Card(
// color: Colors
//     .primaries[Random().nextInt(Colors.primaries.length)],
// elevation: 20,
// child: Container(
// alignment: Alignment.center,
// child: Text(
// e,
// style:
// const TextStyle(color: Colors.white, fontSize: 20),
// ),
// ),
// ),
// ).toList(),
// ),
// ),
