import 'package:articles_app_challenge/core/theme/theme.dart';
import 'package:articles_app_challenge/core/utils/images.dart';
import 'package:articles_app_challenge/features/articles/domain/entity/article_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';

class ScrollArticlesImage extends StatefulWidget {
  final List<ArticleEntity> articles;
  const ScrollArticlesImage({super.key, required this.articles});

  @override
  State<ScrollArticlesImage> createState() => _ScrollArticlesImageState();
}

class _ScrollArticlesImageState extends State<ScrollArticlesImage> {
  @override
  void initState() {
    super.initState();
  }

  Widget selectCorrectImg(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: LoadingAnimationWidget.hexagonDots(
            size: MediaQuery.of(context).size.height * 0.08,
            color: Palette.blue),
      ),
      errorWidget: (context, url, error) => Image.asset(
        Images.notFoundImg,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return _imageBuilder(screenSize);
  }

  Widget _imageBuilder(Size screenSize) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.articles.length,
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(widget.articles[index].publishedAt);
        String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

        return SizedBox(
          width: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: screenSize.width * 1,
                height: screenSize.height * 0.6,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: selectCorrectImg(widget.articles[index].urlToImage),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: screenSize.height * 0.2,
                      width: screenSize.width * 0.6,
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.45,
                            child: Center(
                              child: Text(
                                widget.articles[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: screenSize.width * 0.023,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.articles[index].author,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Palette.secondary,
                                      fontSize: screenSize.width * 0.020,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(width: screenSize.width * 0.3),
                                Text(
                                  formattedDate,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Palette.ligthblue,
                                      fontSize: screenSize.width * 0.020,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
