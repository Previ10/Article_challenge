import 'package:articles_app_challenge/core/router/router.dart';
import 'package:articles_app_challenge/core/services/dependencies_injection_service.dart';
import 'package:articles_app_challenge/core/theme/theme.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: darkTheme,
      theme: theme,
      themeMode: ThemeMode.system,
      key: navigatorKey,
      routerConfig: appRouter,
      title: 'ARTICLES-APP',
      debugShowCheckedModeBanner: false,
    );
  }
}
