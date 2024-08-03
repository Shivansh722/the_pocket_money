import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          const Text(
            'Product Manager',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Text(
                    'Jobs Applied',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '12',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                child: const VerticalDivider(
                  color: Colors.grey,
                  width: 20,
                  thickness: 1,
                ),
              ),
              const Column(
                children: [
                  Text(
                    'Received',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '21',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                child: const VerticalDivider(
                  color: Colors.grey,
                  width: 20,
                  thickness: 1,
                ),
              ),
              const Column(
                children: [
                  Text(
                    'Contacted',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '3',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.centerLeft,
            child: const Text(
              'About',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text('Card 1'),
                  ),
                ),
                SizedBox(width: 8),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text('Card 2'),
                  ),
                ),
                SizedBox(width: 8),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text('Card 3'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
