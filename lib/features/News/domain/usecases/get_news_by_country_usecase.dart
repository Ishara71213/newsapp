import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class GetNewsByCountryUsecase {
  final NewsRepository _repository;

  GetNewsByCountryUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<List<NewsArticleEntity>> call() async {
    Filter filter = const Filter();
    return await _repository.getNewsByCountry(filter);
  }
}
