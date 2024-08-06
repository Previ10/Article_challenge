import 'package:articles_app_challenge/core/theme/theme.dart';
import 'package:articles_app_challenge/core/utils/images.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';

class ArticleDetailPage extends StatefulWidget {
  final ArticleEntity article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final dateTime = DateTime.parse(widget.article.publishedAt);
    final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            widget.article.urlToImage.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.article.urlToImage,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(Images.notFoundImg);
                      },
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(Images.notFoundImg)),
            const SizedBox(height: 10),
            Text(
              widget.article.title,
              style: GoogleFonts.poppins(
                fontSize: screenSize.width * 0.023,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Author: ${widget.article.author}',
              style: GoogleFonts.poppins(
                  fontSize: screenSize.width * 0.023,
                  fontWeight: FontWeight.w200,
                  color: Palette.primary),
            ),
            const SizedBox(height: 10),
            Text(
              formattedDate,
              style: GoogleFonts.poppins(
                  fontSize: screenSize.width * 0.023,
                  fontWeight: FontWeight.w500,
                  color: Palette.secondary),
            ),
            const SizedBox(height: 10),
            Text(
              widget.article.description,
              style: GoogleFonts.poppins(
                  fontSize: screenSize.width * 0.023,
                  fontWeight: FontWeight.w200,
                  color: Palette.primary),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Font url:',
                  style: TextStyle(),
                ),
                Link(
                  uri: Uri.parse(widget.article.url),
                  builder: (context, followLink) => TextButton(
                    onPressed: followLink,
                    child: Text(
                      widget.article.url,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
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
