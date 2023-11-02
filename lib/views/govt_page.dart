import 'dart:math';

import 'package:mirror_wall/model/connect_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/connect.dart';
import '../providers/web_provider.dart';

class GovtPage extends StatefulWidget {
  const GovtPage({super.key});

  @override
  State<GovtPage> createState() => _HomePageState();
}

class _HomePageState extends State<GovtPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ConnectivityProvider>(context, listen: false)
        .checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Goverment Services"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: (Provider.of<ConnectivityProvider>(context)
                    .connectivityModel
                    .connectivityStatus ==
                'Offline')
            ? const Text("You are Offline...")
            : GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: Provider.of<WebProvider>(context)
              .GovtList
              .map(
                (e) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('web', arguments: e);
              },
              child: Card(
                semanticContainer: true,
                color: Colors.primaries[
                Random().nextInt(Colors.primaries.length)],
                elevation: 5,
                child: Image.network('${e.imgURL}',fit: BoxFit.scaleDown,alignment: Alignment.center),
              ),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
