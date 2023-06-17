import 'package:error_screen/Error_Screen/Screen%201.dart';
import 'package:error_screen/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,),
      darkTheme: ThemeData(brightness: Brightness.dark,),
      themeMode: ThemeMode.system,
      home: ErrorHomePage(),
    );
  }
}
