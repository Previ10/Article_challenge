import 'package:articles_app_challenge/core/use_cases/failure.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ArticlesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class OnLoading extends ArticlesState {}

class OnFetchArticlesLoaded extends ArticlesState {
  final List<ArticleEntity> articles;

  OnFetchArticlesLoaded({required this.articles});

  @override
  List<Object> get props => [articles];
}

class OnFetchArticlesFailure extends ArticlesState {
  final Failure failure;

  OnFetchArticlesFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
