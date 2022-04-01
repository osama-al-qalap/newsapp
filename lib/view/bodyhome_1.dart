// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, curly_braces_in_flow_control_structures, unused_import, duplicate_import, prefer_const_constructors_in_immutables, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/viewmodel/view_model.dart';

class bodyhome extends GetWidget<NewsViewModel> {
  final controller = Get.put(NewsViewModel());
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorieModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(categorieModel[index]['routeName']);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(1),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            child: Image.asset(categorieModel[index]['image'])),
                        Text(
                          '${categorieModel[index]['name']}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
            flex: 6,
            child: FutureBuilder(
              future: controller.getdata('Business'),
              builder: (context, AsyncSnapshot snapshot) {
                NewModel? data = snapshot.data;
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: data!.articles!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        borderOnForeground: true,
                        child: Column(children: [
                          data.articles![index].urlToImage.toString() == null
                              ? Image.asset('assets/images/10.png')
                              : Image.network(
                                  data.articles![index].urlToImage.toString()),
                          Text(
                            data.articles![index].title.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data.articles![index].title.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ]),
                      );
                    },
                  );
                }
                if (snapshot.hasError) return Text('Error1');
                return Text('Error');
              },
            ))
      ],
    );
  }
}
