import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/model/web_model.dart';
import 'package:mirror_wall/providers/web_provider.dart';
import 'package:provider/provider.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    Object? args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("seaching for ${searchController.text}"),
      ),
      body: InAppWebView(
          initialUrlRequest: URLRequest(
        url: Uri.parse(
            "https://www.google.com/search?q=${searchController.text}"),
      )),



    );
  }
}
