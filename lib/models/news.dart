class NewsModel {
  final String id;
  final String title;
  final String post_at;
  final String thumbnail;
  final String topicId;
  final String content;
  final String auther;
  final String excerpt;

  NewsModel({
    this.id,
    this.auther,
    this.content,
    this.excerpt,
    this.post_at,
    this.thumbnail,
    this.title,
    this.topicId,
  });
}
