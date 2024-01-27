import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class FilterNewsUsecase {
  final NewsRepository _repository;

  FilterNewsUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<List<NewsArticleEntity>> call(Filter filter) async {
    List<NewsArticleEntity> newsList =
        await _repository.getNewsByCountry(filter);
    List<NewsArticleEntity> newsListWithSavedData = [];
    newsList.map((e) async {}).toList();

    for (NewsArticleEntity entity in newsList) {
      var result = await _repository.getNewsByUrl(entity.url!);
      if (result != null) {
        newsListWithSavedData
            .add(entity.copyWith(isSaved: true, id: result.id));
      } else {
        newsListWithSavedData.add(entity);
      }
    }
    return newsListWithSavedData;
  }
}
