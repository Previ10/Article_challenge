import 'package:articles_app_challenge/core/services/prefernces_services.dart';
import 'package:articles_app_challenge/features/articles/data/models/article_response_model.dart';

abstract class ArticlesLocalDataSourcesBase {
  final PreferencesServicesBase prefs;

  ArticlesLocalDataSourcesBase({required this.prefs});

  Future<void> setArticlesToLocal(ArticleResponseModel articles, String key);

  Future<ArticleResponseModel> getArticlesFromLocal(String key);

  Future<void> deleteArticlesFromLocal(String key);
}

class ArticlesLocalDataSources extends ArticlesLocalDataSourcesBase {
  ArticlesLocalDataSources({required super.prefs});

  @override
  Future<void> setArticlesToLocal(
      ArticleResponseModel articles, String key) async {
    await prefs.setEntity(articles, key);
  }

  @override
  Future<ArticleResponseModel> getArticlesFromLocal(String key) async {
    return await prefs.getEntityAsJson(key);
  }

  @override
  Future<void> deleteArticlesFromLocal(String key) async {
    await prefs.deleteEntity(key);
  }
}
