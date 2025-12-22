import 'package:flutter/material.dart';
import 'tabs/classrioom_students.dart';
import 'tabs/classroom_assignment.dart';
import 'tabs/classroom_feed.dart';

enum ClassroomTab { feedTab, studentsTab, assignmentTab}
class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  ClassroomTab _currentTab = ClassroomTab.feedTab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.classroomId)),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          ClassroomFeeds(classroomId: widget.classroomId),
          ClassroomStudents(classroomId: widget.classroomId),
          ClassroomAssignment(classroomId: widget.classroomId)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentTab = ClassroomTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people), 
            label: 'Students'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Assignment'
          )
         
        ],
      ),
    );
  }
}
