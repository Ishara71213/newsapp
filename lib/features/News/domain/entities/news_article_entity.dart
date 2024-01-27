import 'package:equatable/equatable.dart';

class NewsArticleEntity extends Equatable {
  final int? id;
  final Map<String, dynamic>? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final DateTime? publishedDate;
  final String? postDuration;
  final bool? isSaved;

  const NewsArticleEntity(
      {this.id,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.publishedDate,
      this.postDuration,
      this.isSaved});

  @override
  List<Object?> get props => [
        id,
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
        publishedDate,
        postDuration,
        isSaved
      ];

  NewsArticleEntity copyWith({
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
    return NewsArticleEntity(
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
}
