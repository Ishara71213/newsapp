import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/usecases/delete_saved_news_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/get_saved_news_list_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/save_news_usercase.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as dev;

part 'saved_news_state.dart';

class SavedNewsCubit extends Cubit<SavedNewsState> {
  final SavedNewsUsecase savedNewsUsecase;
  final DeleteSavedNewsUsecase deleteSavedNewsUsecase;
  final GetSavedNewsListUsecase getSavedNewsListUsecase;
  SavedNewsCubit({
    required this.savedNewsUsecase,
    required this.deleteSavedNewsUsecase,
    required this.getSavedNewsListUsecase,
  }) : super(SavedNewsInitial());

  List<NewsArticleEntity> savedNewsList = [];

  Future<void> refreshList() async {
    await lodaSavedNewsList();
    //emit(RefreshSuccess());
  }

  Future<int> saveNews(NewsArticleEntity entity) async {
    try {
      //emit(SavedNewsLoading());
      NewsArticleEntity result = await savedNewsUsecase.call(entity);
      if (result.isSaved!) {
        //emit(SavedNewsLodaingSuccess());
        return result.id!;
      }
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return 0;
  }

  Future<bool> unsaveNews(int id) async {
    try {
      emit(SavedNewsLoading());
      bool result = await deleteSavedNewsUsecase.call(id);
      emit(SavedNewsLodaingSuccess());
      return result;
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return false;
  }

  Future<void> lodaSavedNewsList() async {
    try {
      emit(SavedNewsLoading());
      savedNewsList = await getSavedNewsListUsecase.call();
      emit(SavedNewsLodaingSuccess());
    } on DatabaseException catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
  }
}
