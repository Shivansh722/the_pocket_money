import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/appbar.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/drawer.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/job_tile.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/company_tile.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/green_tile.dart'; // Ensure this import is correct

enum Page { Home, Page1, Page2 }

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  Page _currentPage = Page.Home;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // Replace with the content of Page 1
      Center(
        child: Text('This is Page 1'),
      ),
      // Replace with the content of Page 2
      Center(
        child: Text('This is Page 2'),
      ),
      // Existing Home Page content
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar with filter icon
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      // Implement filter action
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Sort tile
              SortTile(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SortPage()),
                  );
                },
              ),
              SizedBox(height: 16.0),
              // Horizontal list of Company Tiles
              Container(
                height: 120.0, // Adjust the height as needed
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CompanyTile(
                        imageAsset: 'assets/dominos.png',
                        companyName: 'Dominos',
                        rating: 4.5,
                        reviewCount: 120,
                      ),
                      CompanyTile(
                        imageAsset: 'assets/subway.png',
                        companyName: 'Subway',
                        rating: 4.0,
                        reviewCount: 95,
                      ),
                      CompanyTile(
                        imageAsset: 'assets/mcD.png',
                        companyName: 'McDonald\'s',
                        rating: 4.2,
                        reviewCount: 200,
                      ),
                      // Add more CompanyTiles as needed
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Recommended Jobs section
              Text(
                'Recommended Jobs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              // List of recommended job tiles
              Column(
                children: [
                  JobTile(
                    imageAsset: 'assets/dominos.png',
                    companyName: 'Dominos',
                    jobLocation: 'Location One',
                    postedTime: '3 days ago',
                  ),
                  JobTile(
                    imageAsset: 'assets/subway.png',
                    companyName: 'Subway',
                    jobLocation: 'Location Two',
                    postedTime: '1 week ago',
                  ),
                  JobTile(
                    imageAsset: 'assets/mcD.png',
                    companyName: 'McDonald\'s',
                    jobLocation: 'Location Three',
                    postedTime: '2 weeks ago',
                  ),
                  // Add more JobTiles as needed
                ],
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HomeStudentDrawer(),
      body: _pages[_currentPage.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage.index,
        onTap: (int index) => setState(() => _currentPage = Page.values[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Page 2',
          ),
        ],
      ),
    );
  }
}

class SortPage extends StatelessWidget {
  const SortPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort Page'),
      ),
      body: Center(
        child: Text('This is the Sort Page'),
      ),
    );
  }
}