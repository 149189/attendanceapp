import 'package:flutter/material.dart';
import 'package:newflutterproject/Frontend/faculty_login.dart';
import 'package:newflutterproject/Frontend/student_login.dart'; // Import the NextPage widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6E8FFF)),
        useMaterial3: true,
      ),
      home: const PersonaSelectionScreen(),
    );
  }
}

class PersonaSelectionScreen extends StatelessWidget {
  const PersonaSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFC9E2FF), Color(0xFF9A6BFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildTopShape(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Who are you ?',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6E8FFF),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      _buildPersonaGrid(context),
                    ],
                  ),
                ),
              ),
              _buildBottomShape(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopShape() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
    );
  }

  Widget _buildPersonaGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1.2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        _buildPersonaItem(context, 'Student', Icons.school),
        _buildPersonaItem(context, 'Faculty', Icons.person),

      ],
    );
  }

  Widget _buildPersonaItem(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        if (title == 'Student') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  student_login()), // Navigate to the NextPage
          );
        } else {
          // Navigate to respective pages for other titles
          switch (title) {
            case 'Faculty':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  FacultyLogin()),
              );
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title selected')),
              );
          }
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 50, color: const Color(0xFF6E8FFF)),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomShape() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
      ),
    );
  }
}
