import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/screens/fln_pages/fln_intro.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/appbar.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/drawer.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/job_tile.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/green_tile.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/company_tile.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HomeStudentDrawer(),
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
                'Top Companies',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),

              //List of company tiles
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CompanyTile(
                      imageAsset: 'assets/mcD.png',
                      companyName: 'Company One',
                      rating: 4.5,
                      reviewCount: 100,
                    ),
                    CompanyTile(
                      imageAsset: 'assets/dominos.png',
                      companyName: 'Company Two',
                      rating: 4.0,
                      reviewCount: 80,
                    ),
                    CompanyTile(
                      imageAsset: 'assets/subway.png',
                      companyName: 'Company Three',
                      rating: 3.5,
                      reviewCount: 60,
                    ),
                    // Add more CompanyTiles as needed
                  ],
                ),
              ),
              SizedBox(height: 16.0),
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


