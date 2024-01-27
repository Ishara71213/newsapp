import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

abstract class NewsLocalDataSource {
  Future<NewsArticleEntity> saveNews(NewsArticleEntity entity);
  Future<bool> deleteNews(int id);
  Future<List<NewsArticleEntity>> getSavedNewsList();
  Future<NewsArticleEntity?> getNewsByUrl(String url);
}
