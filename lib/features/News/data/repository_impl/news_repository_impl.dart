import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<NewsArticleEntity>> getNewsByCountry(Filter filter) async {
    return await remoteDataSource.getNewsByCountry(filter);
  }
}
