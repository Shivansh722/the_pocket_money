import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String? locationDetails;

  const Page3({super.key, this.locationDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Current Location',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Your current city will help us find you the best jobs',
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Row(
                      children: [
                        Image.asset('assets/location.png',
                            height: 50, width: 50),
                        const SizedBox(width: 10),
                        Text(
                          locationDetails ?? 'Location not available',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
