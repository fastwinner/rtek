import 'package:flutter/material.dart';
import 'package:rtek/view/Pages/Accueil.dart';
import 'package:rtek/view/Pages/navbar.dart';
import 'package:rtek/view/Pages/test.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF748CDF)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: navbar(),
    );
  }
}
