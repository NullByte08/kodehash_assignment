/*
 * *
 *  * Created by NullByte08 in 2024.
 *
 */

class NewsApiResponseModel {
  String status;
  int totalResults;
  List<ArticleModel> articles;

  NewsApiResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsApiResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'] != null ? List<ArticleModel>.from(json['articles'].map((article) => ArticleModel.fromJson(article))) : [],
    );
  }
}

class ArticleModel {
  SourceModel? source;
  String author;
  String title;
  String description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: json["source"] != null ? SourceModel.fromJson(json['source']) : null,
      author: json['author'] ?? "-",
      title: json['title'] ?? "-",
      description: json['description'] ?? "-",
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'] ?? "-",
    );
  }
}

class SourceModel {
  String? id;
  String? name;

  SourceModel({this.id, this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
