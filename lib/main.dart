import 'package:flutter/material.dart';
import 'package:mirror_wall/providers/connect.dart';
import 'package:mirror_wall/providers/web_provider.dart';
import 'package:mirror_wall/views/homepage.dart';
import 'package:mirror_wall/views/web_screeen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [ ChangeNotifierProvider(
        create: (context) => ConnectivityProvider(),
      ),
        ChangeNotifierProvider(
          create: (context) => WebProvider(),
        ),],builder: (context, _) => MyApp(),)
       );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) =>  HomePage(),
        'web': (context) =>  WebView(),
      },
    );
  }
}
