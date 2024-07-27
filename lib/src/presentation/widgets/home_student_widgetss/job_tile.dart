import 'package:flutter/material.dart';

class JobTile extends StatelessWidget {
  final String imageAsset;
  final String companyName;
  final String jobLocation;
  final String postedTime;

  const JobTile({super.key, 
    required this.imageAsset,
    required this.companyName,
    required this.jobLocation,
    required this.postedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Image.asset(imageAsset, width: 50.0, height: 90.0),
        title: Text(companyName),
        subtitle: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.grey.withOpacity(0.5),
              size: 20.0,
            ),
            SizedBox(width: 4.0),
            Text(
              jobLocation,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: Column(
          children: [
            IconButton(
              icon: Icon(Icons.bookmark_border, size: 20.0),
              onPressed: () {
                // Implement bookmark action
              },
            ),
          ],
        ),
      ),
    );
  }
}
