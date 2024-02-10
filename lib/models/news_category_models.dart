class NewsCategory {
  String? status;
  int? totalResults;
  List<Results>? results;
  String? nextPage;

  NewsCategory({this.status, this.totalResults, this.results, this.nextPage});

  NewsCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = this.nextPage;
    return data;
  }
}

class Results {
  String? articleId;
  String? title;
  String? link;
  List<String>? creator;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  String? sourceUrl;
  int? sourcePriority;
  List<String>? country;
  List<String>? category;
  String? language;
  String? aiTag;
  String? sentiment;
  String? sentimentStats;
  String? aiRegion;

  Results(
      {this.articleId,
      this.title,
      this.link,
      this.creator,
      this.description,
      this.content,
      this.pubDate,
      this.imageUrl,
      this.sourceId,
      this.sourceUrl,
      this.country,
      this.category,
      this.language,
      this.aiTag,
      this.sentiment,
      this.sentimentStats,
      this.aiRegion});

  Results.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    if (json['creator'] != null) {
      creator = List<String>.from(json['creator']);
    }
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourceUrl = json['source_url'];
    country =
        json['country'] != null ? List<String>.from(json['country']) : null;
    category =
        json['category'] != null ? List<String>.from(json['category']) : null;
    language = json['language'];
    aiTag = json['ai_tag'];
    sentiment = json['sentiment'];
    sentimentStats = json['sentiment_stats'];
    aiRegion = json['ai_region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['link'] = this.link;
    data['creator'] = this.creator;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['source_url'] = this.sourceUrl;
    data['country'] = this.country;
    data['category'] = this.category;
    data['language'] = this.language;
    data['ai_tag'] = this.aiTag;
    data['sentiment'] = this.sentiment;
    data['sentiment_stats'] = this.sentimentStats;
    data['ai_region'] = this.aiRegion;
    return data;
  }
}
