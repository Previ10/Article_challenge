import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';

abstract class ArticleResponseEntity {
  final String status;
  final int totalResults;
  final List<ArticleEntity> articles;

  ArticleResponseEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}
