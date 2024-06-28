import 'package:flutter/material.dart';
import 'package:newflutterproject/Backend/FaceAuth/authenticate_face/authenticate_face_view.dart';
import 'package:newflutterproject/Backend/FaceAuth/register_face/register_face_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Backend/FaceAuth/common/utils/screen_size_util.dart';

class StudentLoggedIn extends StatefulWidget {
  const StudentLoggedIn({Key? key}) : super(key: key);

  @override
  _StudentLoggedInState createState() => _StudentLoggedInState();
}

class _StudentLoggedInState extends State<StudentLoggedIn> {

  bool hasScannedFace = false;

  @override
  void initState() {
    ScreenSizeUtil.context = context;
    super.initState();
    // Check if user has already scanned their face
    checkFaceScanStatus();
  }

  Future<void> checkFaceScanStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool scanned = prefs.containsKey('face_scanned');
    setState(() {
      hasScannedFace = scanned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Student !',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple.shade400,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade200, Colors.purple.shade200],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: hasScannedFace
                      ? null // Disable button if face has been scanned
                      : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterFaceView(),
                      ),
                    );
                  },
                  child: Text('Register'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      hasScannedFace ? Colors.grey : Colors.purple.shade500,
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AuthenticateFaceView(),
                      ),
                    );
                    // Add give attendance functionality here
                  },
                  child: Text('Give Attendance'),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.purple.shade300),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
