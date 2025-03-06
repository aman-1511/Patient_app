import 'package:flutter/material.dart';

late Future<Pateint> future;

class Getpatientdata extends StatefulWidget {
  const Getpatientdata({super.key});

  @override
  State<Getpatientdata> createState() => _GetpatientdataState();
}

class _GetpatientdataState extends State<Getpatientdata> {
  void initState() {
    super.initState();
    futurePatient = fetchPatient();
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
