import 'package:articles_app_challenge/core/utils/images.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ArticleDetailPage extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage.isNotEmpty)
              Image.network(
                article.urlToImage,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(Images.notFoundImg);
                },
              )
            else
              Image.asset(Images.notFoundImg),
            const SizedBox(height: 10),
            Text(
              article.title,
            ),
            const SizedBox(height: 10),
            Text(
              'Author: ${article.author}',
            ),
            const SizedBox(height: 10),
            Text(
              'Published At: ${article.publishedAt}',
            ),
            const SizedBox(height: 10),
            Text(
              article.description,
            ),
            const SizedBox(height: 10),
            Link(
              uri: Uri.parse(article.url),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text(
                  'Font url: ${article.url}',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
