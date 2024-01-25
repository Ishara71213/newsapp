import 'package:get_it/get_it.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource.dart';
import 'package:newsapp/features/News/data/data_sources/remote/news_remote_datasource_impl.dart';
import 'package:newsapp/features/News/data/repository_impl/news_repository_impl.dart';
import 'package:newsapp/features/News/domain/repository/news_repository.dart';
import 'package:newsapp/features/News/domain/usecases/get_news_by_country_usecase.dart';
import 'package:newsapp/features/News/domain/usecases/get_popular_news_usecase.dart';
import 'package:newsapp/features/News/presentation/home_screen/bloc/cubit/home_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Bloc/cubit
  sl.registerFactory<HomeCubit>(() => HomeCubit(
        getNewsByCountryUsecase: sl.call(),
        getPopularNewsUsecase: sl.call(),
      ));

  //usecase

  //News usecases
  sl.registerLazySingleton<GetNewsByCountryUsecase>(
      () => GetNewsByCountryUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetPopularNewsUsecase>(
      () => GetPopularNewsUsecase(repository: sl.call()));

  //repositories
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(remoteDataSource: sl.call()));

  //data source
  // sl.registerLazySingleton<NewsLocalDataSource>(
  //     () => NewsLocalDataSourceImpl());
  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl());

  //internal
  // final DbContext dbContext = DbContext.instance;
  // final Database db = await dbContext.database;

  //sl.registerLazySingleton(() => db);
}
