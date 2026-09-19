class SourceModel {
  final String status;
  final List<Source> sources;

  SourceModel({required this.status, required this.sources});
  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      status: json['status'],
      sources: List<Source>.from(json['sources'].map((e) => Source.fromJson(e))).toList(),
    );
  }
}

class Source {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      language: json['language'],
      country: json['country'],);


  }
}
