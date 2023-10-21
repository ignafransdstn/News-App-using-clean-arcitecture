import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

    //API methods
    Future<List<ArticleEntity>> getSavedArticles();

    //Database Methods
    Future <void> saveArticle(ArticleEntity article);

    Future <void> removeArticle(ArticleEntity article);
}