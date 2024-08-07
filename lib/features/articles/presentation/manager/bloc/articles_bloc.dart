import 'package:articles_app_challenge/features/articles/domain/use_case/fetch_articles_use_cases.dart';
import 'package:articles_app_challenge/features/articles/presentation/manager/bloc/articles_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'articles_event.dart';

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
