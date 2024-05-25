import 'dart:convert';
import 'package:http/http.dart';
import 'dart:convert';

class Network {
  static String BASE = "newsapi.org";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Apis*/
  static String API_GET_INFOS = "/v2/everything";

  /* Http Params */

  static Map<String, String> paramsArticle() {
    Map<String, String> params = {};
    params.addAll({
      'q': "tesla",
      'sortBy': 'publishedAt',
      'apiKey': '5afcf8264abf4d82aea6c75c4ceb1090'
    });
    return params;
  }

  /* Http Parsing */

  static List<Article> parseArticles(String response) {
    dynamic json = jsonDecode(response);
    return ArticlesList.fromJson(json).articles;
  }
}




ArticlesList articlesListFromJson(String str) => ArticlesList.fromJson(json.decode(str));

String articlesListToJson(ArticlesList data) => json.encode(data.toJson());

class ArticlesList {
  String status;
  int totalResults;
  List<Article> articles;

  ArticlesList({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesList.fromJson(Map<String, dynamic> json) => ArticlesList(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}