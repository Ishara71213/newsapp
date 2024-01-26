import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class FilterNewsUsecase {
  final NewsRepository _repository;

  FilterNewsUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<List<NewsArticleEntity>> call(Filter filter) async {
    return await _repository.getNewsByCountry(filter);
  }
}
