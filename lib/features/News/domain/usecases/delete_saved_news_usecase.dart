import 'package:newsapp/features/News/domain/repository/news_repository.dart';

class DeleteSavedNewsUsecase {
  final NewsRepository _repository;

  DeleteSavedNewsUsecase({required NewsRepository repository})
      : _repository = repository;

  Future<bool> call(int id) async {
    return await _repository.deleteNews(id);
  }
}
