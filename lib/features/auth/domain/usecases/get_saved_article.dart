import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';
import 'package:news_app/features/auth/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    // TODO: implement call
    return _articleRepository.getSavedArticles();
  }
}
