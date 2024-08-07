import 'package:articles_app_challenge/core/use_cases/failure.dart';
import 'package:articles_app_challenge/features/articles/data/models/article_model.dart';
import 'package:articles_app_challenge/features/articles/domain/use_case/fetch_articles_use_cases.dart';
import 'package:articles_app_challenge/features/articles/presentation/manager/bloc/articles_bloc.dart';
import 'package:articles_app_challenge/features/articles/presentation/manager/bloc/articles_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//SIMULACION CASO DE USO UTILIZANDO MOCKTAIL:

class MockFetchArticlesUseCases extends Mock implements FetchArticlesUseCases {}

class MockFailure extends Failure {
  const MockFailure(String message) : super(message: message);
}

var testArticles = [
  ArticleModel(
    title: 'Test Article',
    description: 'Test Description',
    url: 'https://example.com',
    urlToImage: 'https://example.com/image.jpg',
    author: 'Test Author',
    publishedAt: '2024-08-06',
  ),
];

void main() {
  late MockFetchArticlesUseCases mockFetchArticlesUseCases;
  late ArticlesBloc articlesBloc;

  setUp(() {
    mockFetchArticlesUseCases = MockFetchArticlesUseCases();
    articlesBloc =
        ArticlesBloc(fetchArticlesUseCases: mockFetchArticlesUseCases);
  });

  test('initial state', () {
    expect(articlesBloc.state, equals(ArticlesInitial()));
  });

  blocTest<ArticlesBloc, ArticlesState>(
    '[OnLoading, OnFetchArticlesLoaded]',
    build: () {
      when(() => mockFetchArticlesUseCases.call(any()))
          .thenAnswer((_) async => Right(testArticles));
      return articlesBloc;
    },
    act: (bloc) => bloc.add(ActionFetchArticles('https://example.com')),
    expect: () => [
      OnLoading(),
      OnFetchArticlesLoaded(articles: testArticles),
    ],
  );

  blocTest<ArticlesBloc, ArticlesState>(
    'emits [OnLoading, OnFetchArticlesFailure] when ActionFetchArticles is added and use case returns failure',
    build: () {
      when(() => mockFetchArticlesUseCases.call(any())).thenAnswer(
          (_) async => const Left(MockFailure('https://example.com')));
      return articlesBloc;
    },
    act: (bloc) => bloc.add(ActionFetchArticles('')),
    expect: () => [
      OnLoading(),
      OnFetchArticlesFailure(failure: const MockFailure('error')),
    ],
  );

  tearDown(() {
    articlesBloc.close();
  });
}
