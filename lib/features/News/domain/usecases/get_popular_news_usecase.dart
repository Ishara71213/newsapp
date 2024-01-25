import 'package:newsapp/core/constants/categories.dart';
import 'package:newsapp/core/constants/sortby.dart';
import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class GetPopularNewsUsecase {
  final NewsRepository _repository;

  GetPopularNewsUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<List<NewsArticleEntity>> call() async {
    Filter filter = const Filter(
        sortBy: SortBy.relevancy, category: Categories.business, pageSize: "6");
    return await _repository.getNewsByCountry(filter);
  }
}
