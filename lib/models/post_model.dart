class Post {
  final int id;
  final String title;
  final String content;
  final String category;
  final String date;
  final String image;
  final String thumbnail;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.date,
    required this.image,
    required this.thumbnail,
  });

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      content: json['content'] ?? 'No Content Available',
      category: json['category'] ?? 'General',
      date: json['publishedAt'] ?? 'Unknown Date',
      image: json['image'] ?? 'assets/images/default_image.png',
      thumbnail: json['thumbnail'] ??
          json['image'] ??
          'assets/images/default_thumbnail.png',
    );
  }
}
