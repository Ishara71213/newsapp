import 'package:equatable/equatable.dart';

class NewsArticleEntity extends Equatable {
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

  const NewsArticleEntity({
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
  });

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
        publishedDate,
        postDuration
      ];
}
