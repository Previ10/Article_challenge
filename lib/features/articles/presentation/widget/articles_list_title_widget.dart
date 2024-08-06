import 'package:articles_app_challenge/core/theme/theme.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ArticlesListTitleWidget extends StatefulWidget {
  final bool isLoading;
  final List<ArticleEntity> articles;

  const ArticlesListTitleWidget({
    super.key,
    required this.isLoading,
    required this.articles,
  });

  @override
  State<ArticlesListTitleWidget> createState() =>
      _ArticlesListTitleWidgetState();
}

class _ArticlesListTitleWidgetState extends State<ArticlesListTitleWidget> {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return _buildContent();
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Palette.primaryFocused,
          rightDotColor: Palette.blue,
          size: screenSize.height * 0.1,
        ),
      );
    } else if (widget.articles.isEmpty) {
      return const Center(child: Text('No articles available'));
    } else {
      return ListView.builder(
        itemCount: widget.articles.length,
        itemBuilder: (context, index) {
          DateTime dateTime =
              DateTime.parse(widget.articles[index].publishedAt);
          String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
          final article = widget.articles[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Palette.intenseGrey,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      width: screenSize.width * 0.001,
                      color: Palette.softGrey)),
              child: Row(
                children: [
                  if (article.urlToImage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage,
                          height: screenSize.height * 0.10,
                          width: screenSize.width * 0.20,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: LoadingAnimationWidget.hexagonDots(
                              color: Palette.blue,
                              size: screenSize.height * 0.1,
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.error, color: Palette.error),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Palette.backgroundColorScaffold,
                              fontSize: screenSize.width * 0.023,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  article.author,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Palette.softGrey,
                                    fontSize: screenSize.width * 0.018,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Text(
                                formattedDate,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Palette.mediumGrey,
                                  fontSize: screenSize.width * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
