import 'package:articles_app_challenge/core/router/router.dart';
import 'package:articles_app_challenge/core/services/dependencies_injection_service.dart';
import 'package:articles_app_challenge/core/theme/theme.dart';
import 'package:articles_app_challenge/core/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.system);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) {
        return ThemeNotifier();
      }),
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp.router(
          darkTheme: darkTheme,
          theme: theme,
          themeMode: themeNotifier.themeMode,
          key: navigatorKey,
          routerConfig: appRouter,
          title: 'ARTICLES-APP',
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
