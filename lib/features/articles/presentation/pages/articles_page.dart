import 'package:articles_app_challenge/core/services/dependencies_injection_service.dart';
import 'package:articles_app_challenge/core/theme/theme.dart';
import 'package:articles_app_challenge/features/articles/data/data_sources/articles_local_data_sources.dart';
import 'package:articles_app_challenge/features/articles/data/models/article_response_model.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:articles_app_challenge/features/articles/presentation/manager/bloc/articles_bloc.dart';
import 'package:articles_app_challenge/features/articles/presentation/widget/articles_list_title_widget.dart';
import 'package:articles_app_challenge/features/articles/presentation/widget/custom_appbar_widget.dart';
import 'package:articles_app_challenge/features/articles/presentation/widget/scroll_articles_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlesPage extends StatefulWidget {
  static const routeName = '/Articles';
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Size screenSize;
  late final ArticlesBloc _articlesBloc;
  late final ArticlesLocalDataSourcesBase articlesLocalDataSources;

  List<ArticleEntity> articles = [];
  bool isLoading = false;
  String currentCountry = 'bbc';
  String _currentUrl =
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=';

  @override
  void initState() {
    super.initState();
    _articlesBloc = getIt<ArticlesBloc>();
    articlesLocalDataSources = getIt<ArticlesLocalDataSourcesBase>();
    _loadLocalArticles();
    _getArticles();
  }

  Future<void> _getArticles() async {
    setState(() {
      isLoading = true;
    });
    _articlesBloc.add(ActionFetchArticles(_currentUrl));
  }

  Future<void> _loadLocalArticles() async {
    final localArticlesResponse =
        await articlesLocalDataSources.getArticlesFromLocal('articles_key');
    setState(() {
      articles = localArticlesResponse.articles;
    });
  }

  Future<void> _saveArticlesInLocal(
      ArticleResponseModel articlesResponse) async {
    await articlesLocalDataSources.setArticlesToLocal(
        articlesResponse, 'articles_key');
  }

  void _onCountrySelected(String value) {
    setState(() {
      switch (value) {
        case 'it':
          _currentUrl =
              'https://newsapi.org/v2/top-headlines?country=it&apiKey=';
          currentCountry = 'it';
          break;
        case 'us':
          _currentUrl =
              'https://newsapi.org/v2/top-headlines?country=us&apiKey=';
          currentCountry = 'us';
          break;
        case 'ar':
          _currentUrl =
              'https://newsapi.org/v2/top-headlines?country=ar&apiKey=';
          currentCountry = 'ar';
          break;
        case 'tr':
          _currentUrl =
              'https://newsapi.org/v2/top-headlines?country=tr&apiKey=';
          currentCountry = 'tr';
          break;
        case 'bbc':
          _currentUrl =
              'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=';
          currentCountry = 'bbc';
          break;
        default:
          _currentUrl =
              'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=';
          currentCountry = 'bbc';
      }
    });
    _getArticles();
  }

  void showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Failed to load articles. Showing local data.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => _articlesBloc,
      child: Scaffold(
        appBar: CustomAppbar(onCountrySelected: _onCountrySelected),
        body: BlocListener<ArticlesBloc, ArticlesState>(
          listener: (context, state) async {
            if (state is OnLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is OnFetchArticlesLoaded) {
              setState(() {
                articles = state.articles;
                isLoading = false;
              });
              final articleResponseModel = ArticleResponseModel(
                  articles: state.articles, status: '', totalResults: 0);
              await _saveArticlesInLocal(articleResponseModel);
            } else if (state is OnFetchArticlesFailure) {
              setState(() {
                isLoading = false;
              });
              await _loadLocalArticles();
              showErrorSnackBar();
            }
          },
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: FadeIn(child: ScrollArticlesImage(articles: articles)),
              ),
              SizedBox(
                height: screenSize.width * 0.08,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent News',
                  style: GoogleFonts.poppins(
                      color: Palette.primary,
                      fontSize: screenSize.width * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.02,
              ),
              Expanded(
                child: FadeIn(
                  child: ArticlesListTitleWidget(
                    articles: articles,
                    isLoading: isLoading,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
