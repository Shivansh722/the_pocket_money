import 'dart:async';

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  final VoidCallback onGetLocation;

  const Page2({super.key, required this.onGetLocation});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
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
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Image.asset('assets/location.png', height: 200, width: 200),
                        const Text(
                          'Discover the best jobs near you',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Please share your current location',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'This will help us find the best jobs for you in your current city or nearby cities.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Bottom left image with pop animation
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
