import 'package:articles_app_challenge/core/services/http_services.dart';
import 'package:articles_app_challenge/features/articles/data/models/article_response_model.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';

abstract class ArticlesRemoteDataSourcesBase {
  Future<List<ArticleEntity>> fetchArticles(String url);
}

class ArticlesRemoteDataSources implements ArticlesRemoteDataSourcesBase {
  final HttpServiceBase http;
  final String apiKey = 'bb7ba8d024034ce4965c6dcbec514265';

  ArticlesRemoteDataSources({required this.http});

  @override
  Future<List<ArticleEntity>> fetchArticles(String path) async {
    try {
      final response = await http.get(
        url: '$path$apiKey',
      );

      final articleResponse = ArticleResponseModel.fromJson(response);
      return articleResponse.articles;
    } catch (e) {
      throw Exception('Error al obtener las noticias: $e');
    }
  }
}
