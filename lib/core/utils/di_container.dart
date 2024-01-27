import 'package:get_it/get_it.dart';
import 'package:newsapp/config/theme/Bloc/bloc/theme_bloc.dart';
import 'package:newsapp/features/News/data/data_sources/local/news_local_data_source.dart';
import 'package:newsapp/features/News/data/data_sources/local/news_local_data_source_impl.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource_impl.dart';
import 'package:newsapp/features/News/data/repository_impl/news_repository_impl.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';
import 'package:newsapp/features/News/domain/usecases/delete_saved_news_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/filter_news_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/get_news_by_country_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/get_popular_news_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/get_saved_news_list_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/save_news_usercase.dart';
import 'package:newsapp/features/News/presentation/filter_screen/bloc/cubit/filter_cubit.dart';
import 'package:newsapp/features/News/presentation/home_screen/bloc/cubit/home_cubit.dart';
import 'package:newsapp/features/News/presentation/saved_news/bloc/cubit/saved_news_cubit.dart';
import 'package:sqflite/sqflite.dart';

import 'db_context.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Theme Bloc
  sl.registerFactory<ThemeBloc>(() => ThemeBloc());

  //Bloc/cubit
  sl.registerFactory<HomeCubit>(() => HomeCubit(
        getNewsByCountryUsecase: sl.call(),
        getPopularNewsUsecase: sl.call(),
        filterNewsUsecase: sl.call(),
      ));
  sl.registerFactory<SavedNewsCubit>(() => SavedNewsCubit(
        savedNewsUsecase: sl.call(),
        deleteSavedNewsUsecase: sl.call(),
        getSavedNewsListUsecase: sl.call(),
      ));
  sl.registerFactory<FilterCubit>(() => FilterCubit());

  //usecase

  //News usecases
  sl.registerLazySingleton<GetNewsByCountryUsecase>(
      () => GetNewsByCountryUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetPopularNewsUsecase>(
      () => GetPopularNewsUsecase(repository: sl.call()));
  sl.registerLazySingleton<FilterNewsUsecase>(
      () => FilterNewsUsecase(repository: sl.call()));
  //Settings usecases
  sl.registerLazySingleton<SavedNewsUsecase>(
      () => SavedNewsUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetSavedNewsListUsecase>(
      () => GetSavedNewsListUsecase(repository: sl.call()));
  sl.registerLazySingleton<DeleteSavedNewsUsecase>(
      () => DeleteSavedNewsUsecase(repository: sl.call()));

  //repositories
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(
        remoteDataSource: sl.call(),
        localDataSource: sl.call(),
      ));

  //data source
  sl.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(db: sl.call()));
  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl());

  //internal
  final DbContext dbContext = DbContext.instance;
  final Database db = await dbContext.database;

  sl.registerLazySingleton(() => db);
}
