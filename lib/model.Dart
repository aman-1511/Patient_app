import 'dart:convert';
import 'package:http/http.dart' as http;

class Patient {
  final int id;
  final String createdAt;
  final String name;
  final String mobileNumber;
  final String? address;

  Patient({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.mobileNumber,
    this.address,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      mobileNumber: json['mobile_number'],
      address: json['address'],
    );
  }
}

class PatientApi {
  static const String apiUrl = 'https://ecxlbqqybibgiqagryho.supabase.co/rest/v1/patients';
  // Replace with your actual Supabase anon key
  static const String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVjeGxicXF5YmliZ2lxYWdyeWhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk3MDQ1NDAsImV4cCI6MjAyNTI4MDU0MH0.ZkQPiM_sUyZpRF9bXbhJWlgQrh8Qm1Bm6vQWyHiJ9Eo';

  static Future<List<Patient>> fetchPatients() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'apikey': SUPABASE_ANON_KEY,
          'Authorization': 'Bearer $SUPABASE_ANON_KEY',
          'Content-Type': 'application/json',
          // Optional: if you want to prefer returned data in JSON format
          'Prefer': 'return=representation'
        },
      );

      if (response.statusCode == 200) {
        // Print response for debugging
        print('Response body: ${response.body}');
        
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((data) => Patient.fromJson(data)).toList();
      } else {
        print('Error status code: ${response.statusCode}');
        print('Error response: ${response.body}');
        throw Exception('Failed to load patients. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching patients: $e');
      throw Exception('Failed to load patients: $e');
    }
  }
}