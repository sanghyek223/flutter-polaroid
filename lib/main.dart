import 'package:flutter/material.dart';
import 'package:polaroid/src/layout.dart';
import 'package:polaroid/src/provider/font_provider.dart';
import 'package:polaroid/src/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
            create: (context) => NavigationProvider()),
        ChangeNotifierProvider<FontProvider>(
            create: (context) => FontProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Layout(),
    );
  }
}
