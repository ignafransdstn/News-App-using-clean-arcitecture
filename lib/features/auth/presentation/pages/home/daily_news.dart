import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/domain/entities/article.dart';
import 'package:news_app/features/auth/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/auth/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app/features/auth/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      // backgroundColor: const Color.fromARGB(255, 57, 26, 144),
      // shadowColor: Colors.deepPurpleAccent[700],
      title: const Text(
        "NETZ News",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.bookmark_outline,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
              onArticlePressed: (article) =>
                  _onArticlePressed(context, article),
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    });
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
