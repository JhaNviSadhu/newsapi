// To parse this JSON data, do
//
//     final newsList = newsListFromJson(jsonString);

import 'dart:convert';

ModelNewsList modelNewsListFromJson(String str) =>
    ModelNewsList.fromJson(json.decode(str));

String modelNewsListToJson(ModelNewsList data) => json.encode(data.toJson());

class ModelNewsList {
  ModelNewsList({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory ModelNewsList.fromJson(Map<String, dynamic> json) => ModelNewsList(
        status: (json["status"] == null) ? null : json["status"],
        totalResults:
            (json["totalResults"] == null) ? null : json["totalResults"],
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": (status == null) ? null : status,
        "totalResults": (totalResults == null) ? null : totalResults,
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

List<Article> userModelFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String userModelToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.isBookmarked = false,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  bool isBookmarked;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: (json["author"] == null) ? null : json["author"],
        title: (json["title"] == null) ? null : json["title"],
        description: (json["description"] == null) ? null : json["description"],
        url: (json["url"] == null) ? null : json["url"],
        urlToImage: (json["urlToImage"] == null) ? null : json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: (json["content"] == null) ? null : json["content"],
        isBookmarked:
            (json["isBookmarked"] == null) ? false : json["isBookmarked"],
      );

  Map<String, dynamic> toJson() => {
        "source": (source == null) ? null : source?.toJson(),
        "author": (author == null) ? null : author,
        "title": (title == null) ? null : title,
        "description": (description == null) ? null : description,
        "url": (url == null) ? null : url,
        "urlToImage": (urlToImage == null) ? null : urlToImage,
        "publishedAt":
            (publishedAt == null) ? null : publishedAt?.toIso8601String(),
        "content": (content == null) ? null : content,
        "isBookmarked": (isBookmarked == null) ? null : isBookmarked,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: (json["id"] == null) ? null : json["id"],
        name: (json["name"] == null) ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": (id == null) ? null : id,
        "name": (name == null) ? null : name,
      };
}
