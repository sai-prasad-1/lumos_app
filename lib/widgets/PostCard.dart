import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lumos/utils.dart';
import 'package:http/http.dart' as http;

class InstagramPost extends StatefulWidget {
  final String Id;
  final String username;
  final String imageUrl;
  final String content;
  final String type;
  final String likes;

  InstagramPost({
    required this.Id,
    required this.username,
    required this.imageUrl,
    required this.content,
    required this.type,
    required this.likes,

  });

  @override
  _InstagramPostState createState() => _InstagramPostState();
}

class _InstagramPostState extends State<InstagramPost> {
  int likeCount = 0;
  bool isLiked = false;
  bool isCommentVisible = false;
  bool showAllText = false;
  String teamId = "";
  Map<String, dynamic> userData = {}; // Store user data
  List<String> comments = [
    'Nice post!',
    'Great shot!',
    'I love this!',
    'Amazing!',
    'Awesome!',
  ];
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
    print(userData['following']);
  }


  bool isTeamRegistration = false;

  @override
  Widget build(BuildContext context) {
    String fullText =
        "Gear up for 36 hours of ideation, collaboration and building! Look around if you've hit a wall, ";

    String displayText =
    showAllText ? fullText : getLimitedText(fullText, 30);

    return Container(
      constraints: BoxConstraints(
        minHeight: 200.0,
      ),
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'New York, NY',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'October 27, 2023',
                      style: TextStyle(
                        color: Color(0xFF38A3A5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 56, 165, 165),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          color: Color(0xFF38A3A5),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 10),
              child: Text(
                displayText,
                softWrap: true,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 2),
            Expanded(
              child: Container(
                child: CarouselSlider(
                  items: [
                    Container(
                      width: double.infinity,
                      color: Colors.pink,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  color: isLiked ? Colors.red : null,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likeCount += isLiked ? 1 : -1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline),
                  onPressed: () {
                    setState(() {
                      isCommentVisible = !isCommentVisible;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle send button press
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    _showRegistrationOptions(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF38A3A5)),
                      color: Color(0xFF38A3A5),
                    ),
                    child: Center(
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text('$likeCount ${likeCount == 1 ? 'like' : 'likes'}'),
            if (isCommentVisible)
              Column(
                children: [
                  for (var comment in comments)
                    ListTile(
                      title: Text(comment),
                    ),
                ],
              ),
            Text('Liked by user1, user2, and 1000 others'),
          ],
        ),
      ),
    );
  }

  String getLimitedText(String text, int wordLimit) {
    List<String> words = text.split(' ');
    if (words.length <= wordLimit) {
      return text;
    }
    return words.take(wordLimit).join(' ') + '...';
  }

  Future<void> _showRegistrationOptions(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Registration Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Individual Registration'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle individual registration
                },
              ),
              ListTile(
                title: Text('Team Registration'),
                onTap: () {
                  _registerTeam(context);
                  Navigator.pop(context);
                  _showTeamRegistration(context);

                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showTeamRegistration(BuildContext context) async {
    final searchController = TextEditingController();
    List<String> teamMembers =['john_doe','alice_wonder','bob_smith','sara_jones'];
    List<String> filteredTeamMembers = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(labelText: 'Search Team Members'),
                            onChanged: (value) {
                              setState(() {
                                // Filter the list based on the search input
                                filteredTeamMembers = teamMembers
                                    .where((member) => member.toLowerCase().contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredTeamMembers.length,
                    itemBuilder: (context, index) {
                      final user = filteredTeamMembers[index];
                      return ListTile(
                        title: Row(
                          children: [
                            Text(user),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                // Handle the Invite button click and call the API for this specific user
                                _sendInvitation(user);
                              },
                              icon: Icon(Icons.send),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle team registration
                    },
                    child: Text('Register Team'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _sendInvitation(String user) async {
  const key = ApiConfig.baseUrl + 'event/invite';

  final Map<String,dynamic> data = {
    'teamId':teamId,
  'userId':user,
  };

  print(data);

  final response = await http.post(
    Uri.parse(key),
    body: data,
  );

  if (response.statusCode == 201) {
    Navigator.of(context).pushNamed('/');
  } else {
    // Handle the error or provide appropriate feedback
    print('Failed to post data. Status code: ${response.body}');
  }


    print('Inviting $user');
  }

  Future<void> _registerTeam(context) async {
    const key = ApiConfig.baseUrl + 'event/register';
print('widget ID ${widget.Id}');
    final Map<String,dynamic> data = {
      'eventId':widget.Id,
      'userId':'praj2k2',
      'name':"levantate"
    };

    print(data);

    final response = await http.post(
      Uri.parse(key),
      body: data,
    );
    final responseData = json.decode(response.body);
    teamId=responseData['team']['ID'];
    if (response.statusCode == 201) {


      print('Data posted successfully $responseData');

    } else {
      // Handle the error or provide appropriate feedback
      print('Failed to post data. Status code: ${response.body}');
    }
  }



}
