import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/auth/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/auth/data/repository/article_repository_impl.dart';
import 'package:news_app/features/auth/domain/repository/article_repository.dart';
import 'package:news_app/features/auth/domain/usecases/get_article.dart';
import 'package:news_app/features/auth/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/auth/domain/usecases/remove_article.dart';
import 'package:news_app/features/auth/domain/usecases/save_article.dart';
import 'package:news_app/features/auth/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/auth/data/data_sources/local/app_database.dart';
import 'features/auth/presentation/bloc/article/local/local_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // DIO
  sl.registerSingleton<Dio>(
    Dio(),
  );

  //Dependecies
  sl.registerSingleton<NewsApiService>(
    NewsApiService(
      sl(),
    ),
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl(),
      sl(),
    ),
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(
      sl(),
    ),
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(
      sl(),
    ),
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(
      sl(),
    ),
  );

  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(
      sl(),
    ),
  );

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(
      sl(),
    ),
  );

  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(
      sl(),
      sl(),
      sl(),
    ),
  );
}
