import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _roomNameTxtCtrl = TextEditingController();

  Future _joinJitsiMeeting() async {
    try {
      String roomName = _roomNameTxtCtrl.text;
      roomName = roomName.length > 0 ? roomName : 'EastItsProduceAstonishingly';

      final options = JitsiMeetingOptions(room: roomName)
        ..serverURL = "https://meet.jit.si/"
        ..userDisplayName = "Flutter"
        ..audioMuted = true;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Classroom'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _roomNameTxtCtrl,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: 'Classroom Name'),
            ),
            SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _joinJitsiMeeting, child: Text('Jitsi'))),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _roomNameTxtCtrl.dispose();
    super.dispose();
  }
}
