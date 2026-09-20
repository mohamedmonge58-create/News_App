class Artical {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String? content;

  Artical({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Artical.fromJson(Map<String, dynamic> json) {
    return Artical(
      author: json['source']['name'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'],
      content: json['content'],



    );
  }
}

