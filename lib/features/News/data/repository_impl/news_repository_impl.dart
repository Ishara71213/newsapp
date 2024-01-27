import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/data/data_sources/local/news_local_data_source.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  NewsRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
  @override
  Future<List<NewsArticleEntity>> getNewsByCountry(Filter filter) async {
    return await remoteDataSource.getNewsByCountry(filter);
  }

  @override
  Future<bool> deleteNews(int id) async {
    return await localDataSource.deleteNews(id);
  }

  @override
  Future<List<NewsArticleEntity>> getSavedNewsList() async {
    return await localDataSource.getSavedNewsList();
  }

  @override
  Future<NewsArticleEntity> saveNews(NewsArticleEntity entity) async {
    return await localDataSource.saveNews(entity);
  }

  @override
  Future<NewsArticleEntity?> getNewsByUrl(String url) async {
    return await localDataSource.getNewsByUrl(url);
  }
}
