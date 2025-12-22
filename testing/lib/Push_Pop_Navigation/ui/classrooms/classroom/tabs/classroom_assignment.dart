import 'package:flutter/material.dart';

class ClassroomAssignment extends StatelessWidget {
  const ClassroomAssignment({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text("List of students assignment for classroom $classroomId"),
      ),
    );
  }
}
