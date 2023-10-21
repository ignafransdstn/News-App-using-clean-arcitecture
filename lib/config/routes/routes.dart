import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';
import 'package:news_app/features/auth/presentation/pages/article_detail/article_detail.dart';
import 'package:news_app/features/auth/presentation/pages/home/daily_news.dart';
import 'package:news_app/features/auth/presentation/pages/saved_article.dart/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
          const DailyNews(),
        );

      case '/ArticleDetails':
        return _materialRoute(
          ArticleDetailsView(
            article: settings.arguments as ArticleEntity,
          ),
        );

      case '/SavedArticles':
        return _materialRoute(
          const SavedArticles(),
        );

      default:
        return _materialRoute(
          const DailyNews(),
        );
    }
  }

  static Route _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
