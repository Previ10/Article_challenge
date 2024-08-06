abstract class ArticleEntity {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String author;
  final String publishedAt;

  ArticleEntity({
    required this.author,
    required this.publishedAt,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
}
