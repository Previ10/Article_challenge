import 'package:articles_app_challenge/features/articles/presentation/pages/splash_article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:articles_app_challenge/features/articles/presentation/pages/articles_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: SplashArticles.routeName,
  routes: [
    GoRoute(
      path: ArticlesPage.routeName,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ArticlesPage(),
      ),
    ),
    GoRoute(
      path: SplashArticles.routeName,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SplashArticles(),
      ),
    ),
  ],
  errorBuilder: (context, state) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(ArticlesPage.routeName);
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Error: ${state.error.toString()}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  },
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
