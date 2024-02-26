class Post {
  final int id;
  final String title;
  final String body;
  final int ?userId;
  final bool ?isMarked;

  Post({required this.id, required this.title, required this.body, this.userId, this.isMarked = false});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      isMarked: false,
    );
  }
}