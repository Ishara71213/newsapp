import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

class NewsArticleModel extends NewsArticleEntity {
  const NewsArticleModel({
    final Map<String, dynamic>? source,
    final String? author,
    final String? title,
    final String? description,
    final String? url,
    final String? urlToImage,
    final String? publishedAt,
    final String? content,
    final DateTime? publishedDate,
    final String? postDuration,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
          publishedDate: publishedDate,
          postDuration: postDuration,
        );

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    DateTime createdDate = DateTime.parse(json['publishedAt']);
    Duration difference = DateTime.now().difference(createdDate);
    String difStr = "";

    if (difference.inHours < 1) {
      difStr = "${difference.inMinutes}m ago";
    } else if (difference.inHours < 24) {
      difStr = "${difference.inHours}h ago";
    } else {
      difStr = "${difference.inDays}d ago";
    }

    return NewsArticleModel(
        source: json['source'],
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
        publishedDate: createdDate,
        postDuration: difStr);
  }

  NewsArticleModel copyWith({
    Map<String, dynamic>? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return NewsArticleModel(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  NewsArticleEntity toEntity() {
    return NewsArticleEntity(
        source: source,
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
        publishedDate: publishedDate,
        postDuration: postDuration);
  }
}
