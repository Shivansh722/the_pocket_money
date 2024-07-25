import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_money/src/presentation/widgets/notification_tile.dart';
 // Import the NotificationTile widget

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   title: const Text(
      //     'Notifications',
          
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,),
          
      //     ),
      //     centerTitle: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recents',
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  NotificationTile(
                    assetPath: 'assets/dominos.png',
                    title: 'Your application in the queue',
                    timeAgo: '2 hours ago',
                  ),
                  NotificationTile(
                    assetPath: 'assets/mcD.png',
                    title: 'Application pending at The Mc Donalds, Ghatkopar',
                    timeAgo: '5 hours ago',
                  ),
                  NotificationTile(
                    assetPath: 'assets/subway.png',
                    title: 'Application accepted at Subway, Powai',
                    timeAgo: '1 day ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
