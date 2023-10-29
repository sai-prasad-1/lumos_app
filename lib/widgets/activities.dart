import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lumos/utils.dart';
import 'dart:convert';

import 'PostCard.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  List<Map<String, dynamic>> postData = []; // List to store post data

  @override
  void initState() {
    super.initState();
    // Fetch data from the URL when the widget initializes
    fetchDataFromUrl();
  }
  Future<void> fetchDataFromUrl() async {
    const url = ApiConfig.baseUrl + 'feed/' + 'praj2k2';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
print(jsonData);
      if (jsonData.containsKey('feed')) {
        final List<dynamic> feedData = jsonData['feed'];

        setState(() {
          // Update the postData list with the fetched data
          postData = feedData.cast<Map<String, dynamic>>();
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postData.length, // Use the length of postData
      itemBuilder: (context, index) {
        final post = postData[index];
        print(post['event']);
        // Create InstagramPost widget with data from the post
        return InstagramPost(
          Id:post['event']['id'].toString(),
          username: post['username'].toString(),
          imageUrl: post['link'].toString(),
          content: post['content'].toString(),
          type: post['type'].toString(),
          likes: post['likes'].toString(),
        );
      },
    );
  }
}
