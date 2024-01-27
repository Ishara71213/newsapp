import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class SavedNewsUsecase {
  final NewsRepository _repository;

  SavedNewsUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<NewsArticleEntity> call(NewsArticleEntity entity) async {
    return await _repository.saveNews(entity);
  }
}
