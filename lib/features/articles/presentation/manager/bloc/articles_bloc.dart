import 'package:articles_app_challenge/features/articles/domain/use_case/fetch_articles_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:articles_app_challenge/core/use_cases/failure.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final FetchArticlesUseCases fetchArticlesUseCases;

  ArticlesBloc({
    required this.fetchArticlesUseCases,
  }) : super(ArticlesInitial()) {
    on<ActionFetchArticles>(_fetchArticles);
  }

  Future<void> _fetchArticles(
    ActionFetchArticles event,
    Emitter<ArticlesState> emit,
  ) async {
    emit(OnLoading());
    final result = await fetchArticlesUseCases.call(event.path);

    result.fold(
      (failure) => emit(OnFetchArticlesFailure(failure: failure)),
      (articles) => emit(OnFetchArticlesLoaded(articles: articles)),
    );
  }
}
