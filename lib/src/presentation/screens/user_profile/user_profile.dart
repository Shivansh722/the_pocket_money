import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/screens/fln_pages/fln_intro.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'The Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/user1.jpg', // Replace with your image asset path
              height: 100,
              width: 100,
            ),
            SizedBox(height: 16),
            // Image.asset(
            //   'assets/logo.gif', // Replace with your gif asset path
            //   height: 100,
            //   width: 100,
            // ),
            // SizedBox(height: 16),
            Text(
              '85%', // Replace with your employment score
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildScoreTile('Skills', 90.0, Colors.red), // Replace with your skill score
                VerticalDivider(color: Colors.grey, width: 1),
                _buildScoreTile('Experience', 75.0, Colors.orange), // Replace with your experience score
                VerticalDivider(color: Colors.grey, width: 1),
                _buildScoreTile('Communication', 80.0, Colors.purple), // Replace with your communication score
              ],
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'John Doe', // Replace with your name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Software Developer', // Replace with your job title
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),  

            
          ],
        ),
      ),
    );
  }

  Widget _buildScoreTile(String title, double score, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '$score%',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
