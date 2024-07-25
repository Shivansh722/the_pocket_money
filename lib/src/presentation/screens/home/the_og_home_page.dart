import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/appbar.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/drawer.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/job_tile.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/green_tile.dart';
 // Ensure this import is correct


class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
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
                    companyName: 'Company One',
                    jobLocation: 'Location One',
                    postedTime: '3 days ago',
                  ),
                  JobTile(
                    imageAsset: 'assets/subway.png',
                    companyName: 'Company Two',
                    jobLocation: 'Location Two',
                    postedTime: '1 week ago',
                  ),
                  JobTile(
                    imageAsset: 'assets/mcD.png',
                    companyName: 'Company Three',
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
