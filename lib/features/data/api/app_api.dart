import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/model/news_model.dart';

abstract class AppApi {
  static Future<ApiResult<NewsModel>> getNews() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=50721c0f68e7462daff2f6999459160a",
        ),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(NewsModel.fromJson(json));
      } else {
        return Error(json["message"]);
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
