import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

class Articles {
  List<Article> articles = [];

  Articles.fromJson(Map<String, dynamic> json) {
    json['articles'].forEach((json) {
      articles.add(Article.fromJson(json));
    });
  }
}

@JsonSerializable()
class Article {
  final String title, description, url, urlToImage;

  Article({this.title, this.description, this.url, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
