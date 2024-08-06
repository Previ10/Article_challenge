part of 'articles_bloc.dart';

@immutable
abstract class ArticlesEvent {}

class ActionFetchArticles extends ArticlesEvent {
  final String path;

  ActionFetchArticles(this.path);
}
