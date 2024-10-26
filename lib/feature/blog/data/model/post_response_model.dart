class PostResponseModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String image;

  PostResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.image
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      image: json['image'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
      'image': image,

    };
  }
}
