import 'package:articles_app_challenge/core/use_cases/failure.dart';
import 'package:articles_app_challenge/core/use_cases/use_case_base.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:articles_app_challenge/features/articles/domain/repositories/article_repositorie_base.dart';
import 'package:dartz/dartz.dart';

class FetchArticlesUseCases extends UseCaseBase<List<ArticleEntity>, String> {
  final ArticleRepositorieBase repositorie;

  FetchArticlesUseCases({required this.repositorie});

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(String params) async {
    return await repositorie.fetchArticles(params);
  }
}
