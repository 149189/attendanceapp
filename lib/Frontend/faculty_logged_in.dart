import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class faculty_logged_in extends StatefulWidget {
  const faculty_logged_in({super.key});

  @override
  _faculty_logged_inState createState() => _faculty_logged_inState();
}

class _faculty_logged_inState extends State<faculty_logged_in> {
  String? selectedSemester;
  String? selectedBranch;
  String? selectedSubject;
  DateTime? selectedDate;
  bool isTakeAttendancePressed = false;

  // Map to store subjects for each semester and branch combination
  final Map<String, Map<String, List<String>>> subjectMap = {
    'Semester 1': {
      'CS': ['Subject 10', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6', 'Subject 7', 'Subject 8', 'Subject 9'],
      'IT': ['Subject 1', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6', 'Subject 7', 'Subject 8', 'Subject 9'],
      // Add other branches for Semester 1
    },
    'Semester 3': {
      'CS': ['Subject 11', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6', 'Subject 7', 'Subject 8', 'Subject 9'],
      'IT': ['Subject 1', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6', 'Subject 7', 'Subject 8', 'Subject 9'],
      // Add other branches for Semester 3
    },
    // Add other semesters and branches
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Teacher !!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButtonFormField<String>(
              hint: Text('Select Semester'),
              value: selectedSemester,
              onChanged: (value) {
                setState(() {
                  selectedSemester = value;
                  selectedSubject = null; // Reset selected subject when semester changes
                });
              },
              items: ['Semester 1', 'Semester 3', 'Semester 5', 'Semester 7']
                  .map((semester) => DropdownMenuItem<String>(
                value: semester,
                child: Text(semester),
              ))
                  .toList(),
            ),
            DropdownButtonFormField<String>(
              hint: Text('Select Branch'),
              value: selectedBranch,
              onChanged: (value) {
                setState(() {
                  selectedBranch = value;
                  selectedSubject = null; // Reset selected subject when branch changes
                });
              },
              items: ['CS', 'IT', 'ECS', 'AIDS', 'AIML', 'EXTC', 'Mechanical', 'IOT']
                  .map((branch) => DropdownMenuItem<String>(
                value: branch,
                child: Text(branch),
              ))
                  .toList(),
            ),
            DropdownButtonFormField<String>(
              hint: Text('Select Subject'),
              value: selectedSubject,
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
              items: selectedSemester != null && selectedBranch != null
                  ? subjectMap[selectedSemester]![selectedBranch]!
                  .map((subject) => DropdownMenuItem<String>(
                value: subject,
                child: Text(subject),
              ))
                  .toList()
                  : null,
            ),
            // ... (existing date picker and buttons)
          ],
        ),
      ),
    );
  }
}