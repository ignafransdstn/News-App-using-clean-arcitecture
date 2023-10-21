import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';
import 'package:news_app/features/auth/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void,ArticleEntity> {
  
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);
  
  @override
  Future<void> call({ArticleEntity ? params}) {
    // TODO: implement call
    return _articleRepository.saveArticle(params!);
  }
  
}