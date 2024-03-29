import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

abstract class NewsRepository {
  Future<List<NewsArticleEntity>> getNewsByCountry(Filter filter);
  Future<NewsArticleEntity> saveNews(NewsArticleEntity entity);
  Future<bool> deleteNews(int id);
  Future<List<NewsArticleEntity>> getSavedNewsList();
  Future<NewsArticleEntity?> getNewsByUrl(String url);
}
