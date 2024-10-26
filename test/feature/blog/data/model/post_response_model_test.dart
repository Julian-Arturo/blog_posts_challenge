import 'package:blog_posts_challenge/feature/blog/data/model/post_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostResponseModel', () {
    test('Debería crear un PostResponseModel desde JSON', () {
      final json = {
        'userId': 1,
        'id': 1,
        'title': 'Publicación de ejemplo',
        'body': 'Este es el cuerpo de una publicación de ejemplo.',
        'image': 'http://example.com/image.jpg',
      };

      final post = PostResponseModel.fromJson(json);

      expect(post.userId, 1);
      expect(post.id, 1);
      expect(post.title, 'Publicación de ejemplo');
      expect(post.body, 'Este es el cuerpo de una publicación de ejemplo.');
      expect(post.image, 'http://example.com/image.jpg');
    });

    test('Debería convertir un PostResponseModel a JSON', () {
      final post = PostResponseModel(
        userId: 1,
        id: 1,
        title: 'Publicación de ejemplo',
        body: 'Este es el cuerpo de una publicación de ejemplo.',
        image: 'http://example.com/image.jpg',
      );

      final json = post.toJson();

      expect(json['userId'], 1);
      expect(json['id'], 1);
      expect(json['title'], 'Publicación de ejemplo');
      expect(json['body'], 'Este es el cuerpo de una publicación de ejemplo.');
      expect(json['image'], 'http://example.com/image.jpg');
    });
  });
}
