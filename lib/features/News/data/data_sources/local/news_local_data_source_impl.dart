import 'package:newsapp/core/constants/db_tables.dart';
import 'package:newsapp/features/News/data/data_sources/local/news_local_data_source.dart';
import 'package:newsapp/features/News/data/model/news_article_model.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:sqflite/sqflite.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final Database db;

  NewsLocalDataSourceImpl({required this.db});

  @override
  Future<bool> deleteNews(int id) async {
    final result = await db.delete(
      DbTables.savednews,
      where: '${NewsFields.id} = ?',
      whereArgs: [id],
    );
    if (result > 0) {
      return true;
    } else {
      throw Exception("Failded To delete data");
    }
  }

  @override
  Future<NewsArticleEntity?> getNewsByUrl(String url) async {
    final maps = await db.query(
      DbTables.savednews,
      columns: NewsFields.columns,
      where: '${NewsFields.url} = ?',
      whereArgs: [url],
    );

    if (maps.isNotEmpty) {
      NewsArticleModel result = NewsArticleModel.fromJson(maps.first);
      NewsArticleEntity entity = result.toEntity();
      return entity;
    } else {
      return null;
    }
  }

  @override
  Future<List<NewsArticleEntity>> getSavedNewsList() async {
    List<NewsArticleEntity> entityList = [];
    final result = await db.query(
      DbTables.savednews,
      columns: NewsFields.columns,
    );
    List<NewsArticleModel> modelList =
        result.map((e) => NewsArticleModel.fromJson(e)).toList();

    for (NewsArticleModel model in modelList) {
      NewsArticleEntity entity = model.toEntity();
      // fetch Data to inverse Order
      entityList.insert(0, entity);
    }
    return entityList;
  }

  @override
  Future<NewsArticleEntity> saveNews(NewsArticleEntity entity) async {
    NewsArticleModel model = NewsArticleModel.fromEntity(entity);

    final id = await db.insert(DbTables.savednews, model.toJson());
    if (id == 0) {
      model = model.copyWith(isSaved: false);
      return model.toEntity();
    } else {
      model = model.copyWith(id: id, isSaved: true);
      return model.toEntity();
    }
  }
}
