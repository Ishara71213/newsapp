import 'package:newsapp/core/constants/db_tables.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

class NewsArticleModel extends NewsArticleEntity {
  const NewsArticleModel(
      {final int? id,
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
      final bool? isSaved})
      : super(
          id: id,
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
          isSaved: isSaved,
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
      id: json.containsKey("_id") ? json["_id"] : null,
      source: json.containsKey("sourceId")
          ? {"id": null, "name": json['sourceName']}
          : json['source'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      publishedDate: createdDate,
      postDuration: difStr,
      isSaved: json.containsKey("isSaved"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NewsFields.id: id,
      NewsFields.sourceId: source?["id"] ?? "",
      NewsFields.sourceName: source?["name"] ?? "",
      NewsFields.author: author ?? "",
      NewsFields.title: title ?? "",
      NewsFields.description: description ?? "",
      NewsFields.url: url ?? "",
      NewsFields.urlToImage: urlToImage ?? "",
      NewsFields.publishedAt: publishedAt ?? "",
      NewsFields.content: content ?? "",
      NewsFields.isSaved: isSaved?.toString() ?? "",
    };
  }

  @override
  NewsArticleModel copyWith({
    int? id,
    Map<String, dynamic>? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    bool? isSaved,
  }) {
    return NewsArticleModel(
      id: id ?? this.id,
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      publishedDate: publishedDate,
      postDuration: postDuration,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  NewsArticleEntity toEntity() {
    return NewsArticleEntity(
      id: id,
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
      isSaved: isSaved,
    );
  }

  factory NewsArticleModel.fromEntity(NewsArticleEntity entity) {
    return NewsArticleModel(
      id: entity.id,
      source: entity.source,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
      publishedDate: entity.publishedDate,
      postDuration: entity.postDuration,
      isSaved: entity.isSaved,
    );
  }
}
