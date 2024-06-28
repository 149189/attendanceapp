import 'package:flutter/material.dart';
import 'package:newflutterproject/Frontend/attendance_trackerpage.dart'; // Make sure to import the AttendanceTrackerPage

class HODPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA), // Light lavender color
      body: Stack(
        children: [
          // Background content
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Builder(
                            builder: (context) {
                              return IconButton(
                                icon: Icon(Icons.menu, color: Colors.white),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'HOD Name',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'ID: 12345678',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                      ),
                    ],
                  ),
                ),
                // Add more content for the main page here
              ],
            ),
          ),
          // Drawer
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: Text(
                    'HOD Name\nID: 12345678',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Notifications'),
                  onTap: () {
                    // Handle navigation
                  },
                ),
                ListTile(
                  title: Text('Attendance Tracker'),
                  onTap: () {
                    // Handle navigation
                  },
                ),
                ListTile(
                  title: Text('» FE'),
                  onTap: () {
                    // Handle navigation
                  },
                ),
                ListTile(
                  title: Text('» SE'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttendanceTrackerPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('» TE'),
                  onTap: () {
                    // Handle navigation
                  },
                ),
                ListTile(
                  title: Text('» BE'),
                  onTap: () {
                    // Handle navigation
                  },
                ),
                ListTile(
                  title: Text('Approve leave'),
                  onTap: () {
                    // Handle navigation
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
