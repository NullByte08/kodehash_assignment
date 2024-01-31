/*
 * *
 *  * Created by NullByte08 in 2024.
 *
 */

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kodehash_assignment/constants.dart';
import 'package:kodehash_assignment/models/new_api_response_model.dart';

class RepositoryClass {
  static Future<NewsApiResponseModel> getTopHeadlines() async {
    var response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey",
    ));

    return NewsApiResponseModel.fromJson(jsonDecode(response.body));
  }
}
