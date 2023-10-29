import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notoifications extends StatefulWidget {
  const Notoifications({Key? key});

  @override
  State<Notoifications> createState() => _NotoificationsState();
}
class _NotoificationsState extends State<Notoifications> {
  Map<String, dynamic> userData = {}; // Store user data
  List<Map<String, dynamic>> teamInvitations = [];

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUserData = prefs.getString('userData');

    if (savedUserData != null) {
      setState(() {
        userData = json.decode(savedUserData);
        print(userData['TeamInvitations']);
        if (userData.containsKey("TeamInvitations")) {
          teamInvitations = List<Map<String, dynamic>>.from(userData["TeamInvitations"]);
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Invitations'),
      ),
      body: ListView.builder(
        itemCount: teamInvitations.length,
        itemBuilder: (context, index) {
          final invitation = teamInvitations[index];
          return ListTile(
            title: Text('Invitation ID: ${invitation["ID"]}'),
            subtitle: Text('Team ID: ${invitation["TeamID"]}'),
            // Add more information as needed
          );
        },
      ),
    );
  }
}
