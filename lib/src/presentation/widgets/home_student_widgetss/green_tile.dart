import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class SortTile extends StatelessWidget {
  final VoidCallback onPressed;

  const SortTile({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.green,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: Radius.circular(8.0),
      dashPattern: [6, 3], // Adjust the dash pattern as needed
      child: Container(
        padding: EdgeInsets.all(16.0), // Adjusted padding
        decoration: BoxDecoration(
          color: Colors.lightGreen.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Test FLN SCORE:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0), // Space between text and image
                Image.asset(
                  'assets/mascot.png', // Replace with your asset path
                  width: 80.0,
                  height: 80.0,
                ),
              ],
            ),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  size: 30.0, // Adjust the size as needed
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
