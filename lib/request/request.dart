import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:news/model/news.dart';

class NewsApi {
  static Future<NewsList> getHeadLines(
      {String category: "general", int page: 0}) async {
    print("request $category - $page");
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=194d68b976d04d4c8a8d004d7d4e9297&page=$page&category=$category");

    return compute(parseResult, response.body);
  }

  static NewsList parseResult(String respond) {
    return NewsList.fromJson(json.decode(respond));
  }
}
