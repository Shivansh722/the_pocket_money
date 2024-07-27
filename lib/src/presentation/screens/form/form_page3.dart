import 'dart:async';

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  final String? locationDetails;

  const Page3({super.key, this.locationDetails});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin{
  int selectedRadius = 2;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward();
    setState(() {
      _visible = true;
    });
    Timer(const Duration(seconds: 3), () {
      _controller.reverse();
      setState(() {
        _visible = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> radius = const [
      DropdownMenuItem<int>(value: 2, child: Text('2')),
      DropdownMenuItem<int>(value: 4, child: Text('4')),
      DropdownMenuItem<int>(value: 6, child: Text('6')),
      DropdownMenuItem<int>(value: 8, child: Text('8')),
      DropdownMenuItem<int>(value: 10, child: Text('10')),
      DropdownMenuItem<int>(value: 20, child: Text('20')),
      DropdownMenuItem<int>(value: 30, child: Text('20+')),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current Location',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Your current city will help us find you the best jobs',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/location.png',
                                height: 50, width: 50),
                            const SizedBox(width: 10),
                            Text(
                              widget.locationDetails ?? 'Location not available',
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
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Card(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Job Radius',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'This will help us find jobs near you',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          DropdownButtonFormField<int>(
                            items: radius,
                            value: selectedRadius,
                            onChanged: (int? value) {
                              setState(() {
                                if (value != null) {
                                  selectedRadius = value;
                                }
                              });
                            },
                            decoration: InputDecoration( 
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              constraints: const BoxConstraints(
                                maxWidth: 90
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _controller,
              child: Image.asset(
                'assets/page2.png', // Replace with your image path
                height: 200, // Adjust the size as needed
                width: 250,
              ),
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
