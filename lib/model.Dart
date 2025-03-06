import 'package:http/http.dart' as http;

 Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('http://localhost:5000/api/auth/login'));
  }

class Patient {
  
  final int id;
  final String created_at;
  final String mobile_number;
  final String address;

  const ({required this.userId, required this.id, required this.title});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title} => Album(
        userId: userId,
        id: id,
        title: title,
      ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}