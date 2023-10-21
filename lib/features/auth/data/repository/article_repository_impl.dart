import 'dart:io';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/auth/data/data_sources/local/app_database.dart';
import 'package:news_app/features/auth/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/auth/data/models/article.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';
import 'package:news_app/features/auth/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(
    this._newsApiService,
    this._appDatabase,
  );

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: catagoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.unknown,
            requestOptions: httpResponse.response.requestOptions,
          ),
          // DioError(
          //   error: httpResponse.response.statusMessage,
          //   response: httpResponse.response,
          //   type: DioErrorType.badResponse,
          //   requestOptions: httpResponse.response.requestOptions,
          // ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() async {
    // TODO: implement getSavedArticles
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    // TODO: implement removeArticle
    return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    // TODO: implement saveArticle
    return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  }
}
