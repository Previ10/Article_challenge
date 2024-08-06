part of 'articles_bloc.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class OnLoading extends ArticlesState {}

class OnFetchArticlesLoaded extends ArticlesState {
  final List<ArticleEntity> articles;

  OnFetchArticlesLoaded({required this.articles});
}

class OnFetchArticlesFailure extends ArticlesState {
  final Failure failure;

  OnFetchArticlesFailure({required this.failure});
}
