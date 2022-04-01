// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/view/bodyhome_1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Futter',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            TextSpan(
              text: 'News',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ])),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shadowColor: Colors.white,
        ),
        body: bodyhome());
  }
}
