import 'package:articles_app_challenge/features/articles/data/models/article_model.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_response_entity.dart';

class ArticleResponseModel extends ArticleResponseEntity {
  ArticleResponseModel({
    required super.articles,
    required super.status,
    required super.totalResults,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return ArticleResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List<dynamic>)
          .map((articleJson) =>
              ArticleModel.fromJson(articleJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles
          .map((article) => (article as ArticleModel).toJson())
          .toList(),
    };
  }

  factory ArticleResponseModel.fromStorage(Map<String, dynamic> json) {
    return ArticleResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List<dynamic>)
          .map((articleJson) =>
              ArticleModel.fromStorage(articleJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toStorage() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles
          .map((article) => (article as ArticleModel).toStorage())
          .toList(),
    };
  }
}
