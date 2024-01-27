class DbTables {
  static const String savednews = "savednews";
}

class NewsFields {
  static final List<String> columns = [
    id,
    sourceId,
    sourceName,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
    isSaved,
  ];

  //table Headders name
  static const String id = "_id";
  static const String sourceId = "sourceId";
  static const String sourceName = "sourceName";
  static const String author = "author";
  static const String title = "title";
  static const String description = "description";
  static const String url = "url";
  static const String urlToImage = "urlToImage";
  static const String publishedAt = "publishedAt";
  static const String content = "content";
  static const String isSaved = "isSaved";
}
