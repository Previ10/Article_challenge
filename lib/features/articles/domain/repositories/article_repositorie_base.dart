import 'package:articles_app_challenge/core/use_cases/failure.dart';
import 'package:articles_app_challenge/features/articles/data/data_sources/articles_local_data_sources.dart';
import 'package:articles_app_challenge/features/articles/data/data_sources/articles_remote_data_sources.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepositorieBase {
  final ArticlesRemoteDataSourcesBase remote;
  final ArticlesLocalDataSourcesBase local;

  ArticleRepositorieBase({required this.remote, required this.local});
  Future<Either<Failure, List<ArticleEntity>>> fetchArticles(String path);
}
