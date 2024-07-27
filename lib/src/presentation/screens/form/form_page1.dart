import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'dart:async';
import 'dart:io';

class Page1 extends StatefulWidget {
  final File? profileImage;
  final VoidCallback onImagePicked;

  const Page1({super.key, this.profileImage, required this.onImagePicked});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  DateTime? selected;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _visible = false;
  String? _selectedGender;

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

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: f.FluentApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          f.Center(
                            child: GestureDetector(
                              onTap: widget.onImagePicked,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: widget.profileImage != null
                                    ? FileImage(widget.profileImage!)
                                    : null,
                                child: widget.profileImage == null
                                    ? const Icon(
                                        Icons.add,
                                        size: 60,
                                        color: Colors.black,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          f.InfoLabel(
                            label: 'Name',
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: f.FontWeight.bold),
                            child: const f.TextBox(
                              placeholder: 'Enter full name',
                              expands: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          f.DatePicker(
                            header: 'Date Of Birth (DOB)',
                            headerStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: f.FontWeight.bold),
                            selected: selected,
                            onChanged: (time) {},
                          ),
                          const SizedBox(height: 10),
                          const Text('Gender',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () => _selectGender('Male'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _selectedGender == 'Male'
                                      ? Colors.white
                                      : Colors.black, backgroundColor: _selectedGender == 'Male'
                                      ? Colors.black
                                      : Colors.white,
                                  side: const BorderSide(
                                      color: Colors.black, width: 1),
                                ),
                                child: const Text('Male'),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _selectGender('Female'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: _selectedGender == 'Female'
                                      ? Colors.white
                                      : Colors.black, backgroundColor: _selectedGender == 'Female'
                                      ? Colors.black
                                      : Colors.white,
                                  side: const BorderSide(
                                      color: Colors.black, width: 1),
                                ),
                                child: const Text('Female'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom left image with pop animation
            Positioned(
              bottom: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _controller,
                child: Image.asset(
                  'assets/page1.png', // Replace with your image path
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
      ),
    );
  }
}
