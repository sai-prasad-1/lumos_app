import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(8),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF38A3A5)),
                          color: Color(0xFF38A3A5)
                      ),
                      child: Center(
                        child: Text(
                          "Post",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    hintText: 'What do you want to talk about?', // Placeholder text
                  ),
                ),
              )
            ],
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 80, // Set the width to make it a square container
                    height: 80, // Set the height to match the width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(100, 56, 165, 165), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0), // Make it fully rounded (circle)
                        ),
                      ),
                      onPressed: () {
                        // Add your button click functionality here
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image, // Your desired icon
                            color: Color(0xFF38A3A5),
                            size: 40,
                          ),
                          SizedBox(height: 8), // Space between the icon and text
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Media',
                    style: TextStyle(
                      color: Colors.blueGrey, // White text color
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

SizedBox(width: 16,),
              Column(
                children: [
                  Container(
                    width: 80, // Set the width to make it a square container
                    height: 80, // Set the height to match the width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(100, 56, 165, 165),// Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0), // Make it fully rounded (circle)
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/add-event');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month, // Your desired icon
                            color: Color(0xFF38A3A5), // Blue color for the icon
                            size: 040,
                          ),
                          SizedBox(height: 8), // Space between the icon and text

                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Event',
                    style: TextStyle(
                      color: Colors.blueGrey, // White text color
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

            ],
          )



        ],
      ),


    );
  }
}
