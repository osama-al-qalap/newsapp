// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/viewmodel/view_model.dart';

class Entertainment extends StatelessWidget {
  Entertainment({Key? key}) : super(key: key);
  final controller = Get.put(NewsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: 'Futter',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
            text: 'News',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )
        ])),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shadowColor: Colors.white,
      ),
      body: FutureBuilder(
        future: controller.getdata(''),
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
                    data.articles![index].urlToImage == null
                        ? Image.asset('assets/images/10.png')
                        : Image.network(
                            data.articles![index].urlToImage.toString()),
                    Text(
                      data.articles![index].title.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
    ;
  }
}
