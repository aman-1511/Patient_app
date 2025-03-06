import 'package:http/http.dart' as http;

Future<Album> fetchPatient() async {
  final response = await http.get(
    Uri.parse('https://ecxlbqqybibgiqagryho.supabase.co/rest/v1/patients'),
  );

  if (response.statusCode == 200) {
  
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    
    throw Exception('Failed to load album');
  }
}
class Patient {
  
  final int id;
  final String created_at;
  final String mobile_number;
  final String address;

  const ({required this.userId, required this.id, required this.title});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'created_at': String created_at, 'mobile_number': String mobile_number, 'address': String address } => Patient(
        userId: userId,
        id: id,
        created_at: created_at,
        mobile_number: mobile_number,
        address: address,

      ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}