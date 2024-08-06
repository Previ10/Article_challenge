import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:articles_app_challenge/core/services/http_services.dart';
import 'package:articles_app_challenge/core/services/prefernces_services.dart';
import 'package:articles_app_challenge/features/articles/data/data_sources/articles_remote_data_sources.dart';
import 'package:articles_app_challenge/features/articles/data/data_sources/articles_local_data_sources.dart';
import 'package:articles_app_challenge/features/articles/data/repositories/articles_repositorie.dart';
import 'package:articles_app_challenge/features/articles/domain/repositories/article_repositorie_base.dart';
import 'package:articles_app_challenge/features/articles/domain/use_case/fetch_articles_use_cases.dart';
import 'package:articles_app_challenge/features/articles/presentation/manager/bloc/articles_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // REGISTRO DE SHARED PREFERENCES:
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // REGISTRO DE CLIENTE HTTP:
  getIt.registerSingleton<Client>(Client());

  // REGISTRO DE SERVICIOS:
  getIt.registerSingleton<HttpServiceBase>(
      HttpService(httpClient: getIt<Client>()));
  getIt.registerSingleton<PreferencesServicesBase>(
      PreferencesServices(prefs: getIt<SharedPreferences>()));

  // REGISTRO DE FUENTES DE DATOS:
  getIt.registerSingleton<ArticlesLocalDataSourcesBase>(
      ArticlesLocalDataSources(prefs: getIt<PreferencesServicesBase>()));
  getIt.registerSingleton<ArticlesRemoteDataSourcesBase>(
      ArticlesRemoteDataSources(http: getIt<HttpServiceBase>()));

  // REGISTRO DE REPOSITORIOS:
  getIt.registerSingleton<ArticleRepositorieBase>(ArticlesRepositorie(
      remote: getIt<ArticlesRemoteDataSourcesBase>(),
      local: getIt<ArticlesLocalDataSourcesBase>()));

  // REGISTRO DE CASOS DE USO:
  getIt.registerSingleton<FetchArticlesUseCases>(
      FetchArticlesUseCases(repositorie: getIt<ArticleRepositorieBase>()));

  // REGISTRO DE BLOC:
  getIt.registerSingleton<ArticlesBloc>(
      ArticlesBloc(fetchArticlesUseCases: getIt<FetchArticlesUseCases>()));
}
