import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> userData = {}; // Store user data

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(userData);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profile_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 30), // Adjust as needed for the overlap

                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              userData['user']['name'] ?? '', // Display user's name
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(userData['user']['username'] ?? '',),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      userData['looms']?.length.toString()?? '0', // Display user's posts count
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                    Text("Posts")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      userData['followerCount'].toString() ?? '', // Display user's followers count
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                    Text("Followers")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      userData['followingCount'].toString() ?? '', // Display user's following count
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                    Text("Following")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(height: 20),
                      Text(
                        'Summary:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData['user']['description'] ?? '', // Display user's summary
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: userData['looms'].length,
                        itemBuilder: (BuildContext context, int index) {
                          final loom = userData['looms'][index];
                          return LoomWidget(loom); // Use the LoomWidget with loom data
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoomWidget extends StatelessWidget {
  final Map<String, dynamic> loomData; // Loom data including content, image URL, event type, and date

  LoomWidget(this.loomData);

  @override
  Widget build(BuildContext context) {
    // Extract data from the loomData
    final String content = loomData['content'] ?? '';
    final String imageUrl = loomData['image_url'] ?? '';
    final String eventType = loomData['type'] ?? ''; // Extract event type
    final String eventDate = loomData['event']['date'] ?? ''; // Extract event date

    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          // Display the image on the left
          Container(
            width: 100, // Adjust as needed
            height: 100, // Adjust as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl), // Load the image from the URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          // Display the loom content on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Event Type: $eventType', // Display event type
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Event Date: $eventDate', // Display event date
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                // Add more details or actions as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
