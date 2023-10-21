import 'package:equatable/equatable.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException error) : super(error: error);
}