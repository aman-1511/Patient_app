import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getpatientdata extends StatefulWidget {
  const Getpatientdata({super.key});

  @override
  State<Getpatientdata> createState() => _GetpatientdataState();
}

class _GetpatientdataState extends State<Getpatientdata> {
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('http://localhost:5000/api/auth/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(itemBuilder: itemBuilder),
      ),
    );
  }
}
