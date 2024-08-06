import 'package:articles_app_challenge/core/use_cases/failure.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:articles_app_challenge/features/articles/domain/repositories/article_repositorie_base.dart';
import 'package:dartz/dartz.dart';

class ArticlesRepositorie extends ArticleRepositorieBase {
  ArticlesRepositorie({required super.remote, required super.local});

  @override
  Future<Either<Failure, List<ArticleEntity>>> fetchArticles(
      String path) async {
    try {
      final response = await remote.fetchArticles(path);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnhandledFailure(message: '$e'));
    }
  }
}
