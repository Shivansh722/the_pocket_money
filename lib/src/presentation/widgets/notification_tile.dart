import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String assetPath;
  final String title;
  final String timeAgo;

  const NotificationTile({
    required this.assetPath,
    required this.title,
    required this.timeAgo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Light grey background
              borderRadius: BorderRadius.circular(4.0),
              // Curved corners
            ),
             // Padding around the image
            child: Padding(
              padding: const EdgeInsets.all(0.5),
              child: ClipRRect(
                
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  assetPath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  timeAgo,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
