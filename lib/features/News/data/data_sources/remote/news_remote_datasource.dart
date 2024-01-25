import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsArticleEntity>> getNewsByCountry(Filter filter);
}
