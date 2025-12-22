import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {

  final String studentId;
  const StudentDetail({
    super.key,
    required this.studentId,
    });

  @override
  State<StudentDetail> createState() => _StudentsState();
}

class _StudentsState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.studentId)),
      body: Container(
        color: Colors.red,
        child: Center(child: Text('Students ${widget.studentId}')),
      ),
    );
  }
}