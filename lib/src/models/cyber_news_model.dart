class CyberNews {
  String sourceName;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  CyberNews.fromJson(
      String sourceName,
      String author,
      String title,
      String description,
      String url,
      String urlToImage,
      String publishedAt,
      String content)
      : sourceName = sourceName,
        author = author,
        title = title,
        description = description,
        url = url,
        urlToImage = urlToImage,
        publishedAt = publishedAt,
        content = content;
}
