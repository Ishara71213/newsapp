import 'dart:convert';

import 'package:newsapp/config/environment/environment.dart';
import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource.dart';
import 'package:newsapp/features/News/data/model/news_article_model.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:http/http.dart' as http;

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<NewsArticleEntity>> getNewsByCountry(Filter filter) async {
    String url =
        '${Environment.baseUrl}top-headlines?${filter.queryParamsBuilder()}';
    List<NewsArticleEntity> itemList = [];
    try {
      final response = await http.get(Uri.parse(url),
          headers: <String, String>{'X-Api-Key': Environment.apiKey});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var result = json['articles'];
        result.forEach((e) {
          NewsArticleModel item = NewsArticleModel.fromJson(e);
          if (item.title != "[Removed]" &&
              item.urlToImage != null &&
              item.title != null) {
            itemList.add(item.toEntity());
          }
        });
        return itemList;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      rethrow;
    }
  }
}
