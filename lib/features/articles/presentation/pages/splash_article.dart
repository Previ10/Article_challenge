import 'dart:async';
import 'package:articles_app_challenge/core/utils/images.dart';
import 'package:articles_app_challenge/features/articles/presentation/pages/articles_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashArticles extends StatefulWidget {
  static var routeName = '/Splash';
  const SplashArticles({super.key});

  @override
  State<SplashArticles> createState() => _SplashArticlesState();
}

class _SplashArticlesState extends State<SplashArticles> {
  late Size screenSize;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.go(ArticlesPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.splashImg,
                fit: BoxFit.cover,
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.72,
              ),
              Text(
                'TOP NEWS HERE',
                style: GoogleFonts.anton(
                    fontSize: screenSize.width * 0.03,
                    letterSpacing: .6,
                    color: Colors.grey.shade700),
              ),
              LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF1A1A3F),
                rightDotColor: const Color.fromARGB(255, 55, 118, 234),
                size: screenSize.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
