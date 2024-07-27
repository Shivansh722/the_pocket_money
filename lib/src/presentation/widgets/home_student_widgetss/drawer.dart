import 'package:flutter/material.dart';

class HomeStudentDrawer extends StatelessWidget {
  const HomeStudentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/user1.jpg'), // replace with your image asset
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Software Developer',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            title: Text('View Profile'),
            onTap: () {
              // Handle the tap
            },
          ),
          Divider(
              thickness: 1, color: Colors.grey[300], indent: 17, endIndent: 10),
          ListTile(
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            title: Text('Settings'),
            onTap: () {
              // Handle the tap
            },
          ),
          Divider(
              thickness: 1, color: Colors.grey[300], indent: 17, endIndent: 10),
          ListTile(
            leading: Icon(Icons.feedback),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            title: Text('Feedback'),
            onTap: () {
              // Handle the tap
            },
          ),
          Divider(
              thickness: 1, color: Colors.grey[300], indent: 17, endIndent: 10),
          ListTile(
            leading: Icon(Icons.help),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            title: Text('FAQs'),
            onTap: () {
              // Handle the tap
            },
          ),
          Divider(
              thickness: 1, color: Colors.grey[300], indent: 17, endIndent: 10),
          ListTile(
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            title: Text('Logout'),
            onTap: () {
              // Handle the tap
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: [
                Center(
                  child: Image.asset('assets/mascot 1.png',
                      height: 100), // replace with your mascot asset
                ),
                Positioned(
                  bottom: 0,
                  left: -30,
                  child: Image.asset('assets/Vector1.png',
                      width: 120, height: 120), // replace with your blob asset
                ),
                Positioned(
                  bottom: -10,
                  top: 10,
                  right: -50,
                  child: Image.asset('assets/Vector2.png',
                      width: 140, height: 150), // replace with your blob asset
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
