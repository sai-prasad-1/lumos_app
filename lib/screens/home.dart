import 'package:flutter/material.dart';
import 'package:lumos/screens/add_event1.dart';
import 'package:lumos/screens/add_event2.dart';
import 'package:lumos/screens/home_main.dart';
import 'package:lumos/screens/profile.dart';
import 'package:lumos/screens/search.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../widgets/activities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBarExample(),
    );
  }
}

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Activities(),
    SearchScreen(),
    AddPost(),
    Screen4(),
    ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[

            Container(child: Image.asset('assets/lumos.png'),width: 100,height: 120,), // Replace with your image asset
            SizedBox(width: 16), // Add some spacing
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.message_outlined,
              color: Colors.blue, // Set the icon color to blue
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/chat-list');
            },
          ),
        ],
      ),

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home),
                Text('Home'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.search),
                Text('Search'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.add),
                Text('Post'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.calendar_month),
                Text('Events'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person_2_rounded),
                Text('Profile'),
              ],
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}



class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 2 Content'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 3 Content'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 4 Content'),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 5 Content'),
    );
  }
}
