import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:articles_app_challenge/features/articles/data/models/article_response_model.dart';

abstract class PreferencesServicesBase {
  final SharedPreferences prefs;

  PreferencesServicesBase({required this.prefs});

  Future<void> setEntity(ArticleResponseModel entity, String key);

  Future<ArticleResponseModel> getEntityAsJson(String key);

  Future<void> deleteEntity(String key);
}

class PreferencesServices extends PreferencesServicesBase {
  PreferencesServices({required super.prefs});

  @override
  Future<void> setEntity(ArticleResponseModel entity, String key) async {
    final map = entity.toJson();
    final value = jsonEncode(map);
    await prefs.setString(key, value);
  }

  @override
  Future<ArticleResponseModel> getEntityAsJson(String key) async {
    final value = prefs.getString(key);

    if (value == null || value.isEmpty) {
      throw Exception('No existe la entidad $key en el local storage');
    }

    try {
      final map = jsonDecode(value) as Map<String, dynamic>;
      return ArticleResponseModel.fromJson(map);
    } catch (e) {
      throw Exception('Error al decodificar el JSON para la clave $key: $e');
    }
  }

  @override
  Future<void> deleteEntity(String key) async {
    await prefs.remove(key);
  }
}
