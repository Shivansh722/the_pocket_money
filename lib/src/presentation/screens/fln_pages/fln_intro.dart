import 'package:flutter/material.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:pocket_money/src/presentation/screens/fln_pages/fluency_check_page.dart';

class SortPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update your FLN'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Displaying the GIF
          Container(
            height: 400.0, // Adjust height as needed
            width: 400.0, // Adjust width as needed
            child: Image.asset('assets/target_animation.gif'), // Path to your GIF asset
          ),
          SizedBox(height: 20), // Space between GIF and text
          // Displaying the big normal text
          Text(
            'The Party is just getting started!',
            style: TextStyle(
              fontSize: 24, // Adjust font size as needed
              fontWeight: FontWeight.bold, // Optional: Make the text bold
            ),
          ),
          SizedBox(height: 20), // Space between text and button
          // Navigation button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioRecorder( )),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white, // Text color of the button
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Button padding
              textStyle: TextStyle(fontSize: 18), // Text style
            ),
            child: Text('Go to Fluency Page'),
          ),
        ],
      ),
    );
  }
}