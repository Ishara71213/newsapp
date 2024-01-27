import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class GetSavedNewsListUsecase {
  final NewsRepository _repository;

  GetSavedNewsListUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<List<NewsArticleEntity>> call() async {
    return await _repository.getSavedNewsList();
  }
}
