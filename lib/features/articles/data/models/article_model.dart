import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    required super.description,
    required super.title,
    required super.url,
    required super.urlToImage,
    required super.author,
    required super.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      author: json['author'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'author': author,
    };
  }

  factory ArticleModel.fromStorage(Map<String, dynamic> json) {
    return ArticleModel(
      description: json['description'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      author: json['author'],
      publishedAt: json['publishedAt'],
    );
  }

  Map<String, dynamic> toStorage() {
    return {
      'description': description,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'author': author,
    };
  }
}
