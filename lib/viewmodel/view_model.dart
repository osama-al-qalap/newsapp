import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_app/model/model.dart';

class NewsViewModel extends GetxController {
  getdata(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=46b6f4edff304cdea052f97cda2ccab7');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewModel.friomjson(
            jsonDecode(response.body)); //يجيب تعريف الموديول
      } catch (e) {
        return Get.snackbar('error', e.toString());
      }
    }
  }
}
