import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'dart:io';

class Page1 extends StatelessWidget {
  final File? profileImage;
  final VoidCallback onImagePicked;

  const Page1({super.key, this.profileImage, required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    DateTime? selected;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: f.FluentApp(
        debugShowCheckedModeBanner: false,
        home: Padding(
          padding: const EdgeInsets.all(10.0),
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
                          onTap: onImagePicked,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: profileImage != null
                                ? FileImage(profileImage!)
                                : null,
                            child: profileImage == null
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
                            color: Colors.black, fontWeight: f.FontWeight.bold),
                        child: const f.TextBox(
                          placeholder: 'Enter full name',
                          expands: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      f.DatePicker(
                        header: 'Date Of Birth (DOB)',
                        headerStyle: const TextStyle(
                            color: Colors.black, fontWeight: f.FontWeight.bold),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: Colors.black, width: 1)),
                            child: const Text('Male',
                                style: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: Colors.black, width: 1)),
                            child: const Text('Female',
                                style: TextStyle(color: Colors.black)),
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
      ),
    );
  }
}