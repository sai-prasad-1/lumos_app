import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> dummyData = [
    {
      'imagePath': 'assets/image1.jpg',
      'description': 'By clicking “Post Your Answer”, you agree to our terms of service and ',
      'likeCount': 5,
    },
    {
      'imagePath': 'assets/image2.jpg',
      'description': 'Description for item 2',
      'likeCount': 12,
    },
    {
      'imagePath': 'assets/image3.jpg',
      'description': 'Description for item 3',
      'likeCount': 8,
    },
    {
      'imagePath': 'assets/image2.jpg',
      'description': 'By clicking “Post Your Answer”, you agree to our terms of service and .',
      'likeCount': 12,
    },
    {
      'imagePath': 'assets/image2.jpg',
      'description': 'Description for item 2',
      'likeCount': 12,
    },
    {
      'imagePath': 'assets/image1.jpg',
      'description': 'By clicking “Post Your Answer”, you agree to ',
      'likeCount': 5,
    },
    {
      'imagePath': 'assets/image1.jpg',
      'description': 'Description for item 1',
      'likeCount': 5,
    },
    // Add more data items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Container(

              padding: EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF38A3A5),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search names,activities....',
                    filled: true,
                    counterStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF38A3A5),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                    child: CategoryItem('Hackathon'),
                  ),
                  Expanded(
                    child: CategoryItem('Arts'),
                  ),
                  Expanded(
                    child: CategoryItem('Design'),
                  ),
                  Expanded(
                    child: CategoryItem('Ethical Hacking'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CategoryItem('Idea Pitching'),
                ),
                Expanded(
                  child: CategoryItem('Ideathon'),
                ),
                Expanded(
                  child: CategoryItem('Coding'),
                ),
                Expanded(
                  child: CategoryItem('Gaming'),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Text(
              "Todays Highlights",
              style: TextStyle(
                fontWeight: FontWeight.bold, // Makes the text bold
                color: Colors.black, // Sets the text color to black
                fontSize: 20
              ),
              textAlign: TextAlign.start, // Aligns the text to the start (left)
            ),

            ListView.builder(
              itemCount: dummyData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = dummyData[index];
                return SearchResultItem(
                  imagePath: item['imagePath'],
                  description: item['description'],
                  likeCount: item['likeCount'],
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;

  CategoryItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF38A3A5)), // Border color
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF38A3A5),
            fontSize: 12
          ),
        ),
      ),
    );
  }
}




class SearchResultItem extends StatefulWidget {
  final String imagePath;
  final String description;
  int likeCount;

  SearchResultItem({
    required this.imagePath,
    required this.description,
    required this.likeCount,
  });

  @override
  _SearchResultItemState createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15,top: 8),
      child: Row(
        children: [
          // Small Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10), // Add a border radius value
            ),
          ),

          // Description and "Know More" Button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 14,),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle "Know More" button press
                        },
                        child: Text(
                          'Know More',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF38A3A5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Like Button and Count
          Row(
            children: [
              IconButton(
                icon: isLiked ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                    widget.likeCount += isLiked ? 1 : -1;
                  });
                },
              ),
              Text('${widget.likeCount} Likes'),
            ],
          ),
        ],
      ),
    );
  }
}

