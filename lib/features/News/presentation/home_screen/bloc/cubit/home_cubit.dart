import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/domain/usecases/filter_news_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/get_news_by_country_usecase.dart';
import 'dart:developer' as dev;

import 'package:newsapp/features/News/domain/usecases/get_popular_news_usecase.dart';
import 'package:newsapp/features/News/presentation/home_screen/widgets/top_news_card.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetNewsByCountryUsecase getNewsByCountryUsecase;
  final GetPopularNewsUsecase getPopularNewsUsecase;
  final FilterNewsUsecase filterNewsUsecase;

  HomeCubit({
    required this.getNewsByCountryUsecase,
    required this.getPopularNewsUsecase,
    required this.filterNewsUsecase,
  }) : super(HomeInitial());

  String errorMsg = "";
  bool _isFilered = false;
  bool get isFiltered => _isFilered;

  Filter _filterGlobal = const Filter();

  Future<List<Widget>> getAllPopularNews() async {
    List<Widget> result = [];
    try {
      List<NewsArticleEntity> entityList = await getPopularNewsUsecase.call();
      for (NewsArticleEntity entity in entityList) {
        result.add(TopNewsCard(
          newsEntity: entity,
        ));
      }
      emit(PopularNewsSuccess());
    } on SocketException catch (e, stacktrace) {
      errorMsg = e.toString();
      emit(PopularNewsFaliure());
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      final error = e.toString();
      errorMsg = error;
      emit(PopularNewsFaliure());
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return result;
  }

  Future<List<NewsArticleEntity>> getAllNewsByCountry({Filter? filter}) async {
    List<NewsArticleEntity> result = [];
    try {
      if (filter != null) {
        _isFilered = true;
        _filterGlobal = filter;
        result = await filterNewsUsecase.call(_filterGlobal);
      } else {
        //to clear filter
        _filterGlobal = const Filter();
        _isFilered = false;
        //search without filter
        result = await getNewsByCountryUsecase.call();
      }
      emit(LoadingSuccess());
    } on SocketException catch (e, stacktrace) {
      errorMsg = e.toString();
      emit(LoadingFaliure());
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    } catch (e, stacktrace) {
      final error = e.toString();
      errorMsg = error;
      emit(LoadingFaliure());
      dev.log(e.toString(), name: "ERROR", stackTrace: stacktrace);
    }
    return result;
  }
}
