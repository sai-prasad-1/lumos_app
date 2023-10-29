import 'package:flutter/material.dart';
import 'package:lumos/widgets/activities.dart';

import '../widgets/PostCard.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0; // Set index to 0 for Activities
                    });
                  },
                  style: _currentIndex == 0
                      ? ElevatedButton.styleFrom(primary: Color(0xFF38A3A5))
                      : null,
                  child: Text('Activities'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1; // Set index to 1 for Careers
                    });
                  },
                  style: _currentIndex == 1
                      ? ElevatedButton.styleFrom(primary: Color(0xFF38A3A5))
                      : null,
                  child: Text('Careers'),
                ),
              ),
            ],
          ),

             Activities(),


        ],
      ),
    );
  }
}
