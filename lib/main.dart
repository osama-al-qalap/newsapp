// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/view/Business.dart';
import 'package:news_app/view/Entertainment_1.dart';
import 'package:news_app/view/General_1.dart';
import 'package:news_app/view/Health_1.dart';
import 'package:news_app/view/Science_1.dart';
import 'package:news_app/view/Sports_1.dart';
import 'package:news_app/view/Technology_1.dart';
import 'package:news_app/view/home_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'Business': (context) => Business(),
        'Entertainment': (context) => Entertainment(),
        'General': (context) => General(),
        'Health': (context) => Health(),
        'Science': (context) => Science(),
        'Sports': (context) => Sport(),
        'Technology': (context) => Technology(),
      },
      home: MyHomePage(),
    );
  }
}
