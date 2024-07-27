import 'dart:async';

import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> with SingleTickerProviderStateMixin {
  int selectedOption = -1;
  late StringTagController _stringTagController;
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

    _stringTagController = StringTagController();
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
    _stringTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('English'),
                        ),
                        ListTile(
                          title: const Text(
                            'No English',
                            style: TextStyle(fontSize: 14),
                          ),
                          leading: Radio(
                            value: 0,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value as int;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Basic',
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            'You can understand/speak basic sentences',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value as int;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Intermediate',
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            'You can have a conversation in English on some topics',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          leading: Radio(
                            value: 2,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value as int;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Advanced',
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            'You can do your entire job in English and speak fluently',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          leading: Radio(
                            value: 3,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value as int;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if(selectedOption!=-1)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add other languages you can speak (optional)',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextFieldTags<String>(
                            textfieldTagsController: _stringTagController,
                            textSeparators: const [' ', ','],
                            letterCase: LetterCase.normal,
                            validator: (String tag) {
                              if (_stringTagController.getTags!.contains(tag)) {
                                return 'You\'ve already entered that';
                              }
                              return null;
                            },
                            inputFieldBuilder: (context, inputFieldValues) {
                              return TextField(
                                onTap: () {
                                  _stringTagController.getFocusNode?.requestFocus();
                                },
                                controller: inputFieldValues.textEditingController,
                                focusNode: inputFieldValues.focusNode,
                                decoration: InputDecoration(
                                  labelText: 'Enter Additional Languages',
                                  labelStyle: TextStyle(color: Colors.grey[600]),
                                  isDense: true,
                                  border: const OutlineInputBorder(),
                                  errorText: inputFieldValues.error,
                                  prefixIconConstraints:
                                      BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                                  prefixIcon: inputFieldValues.tags.isNotEmpty
                                      ? SingleChildScrollView(
                                          controller: inputFieldValues.tagScrollController,
                                          scrollDirection: Axis.vertical,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 8,
                                            ),
                                            child: Wrap(
                                                runSpacing: 4.0,
                                                spacing: 4.0,
                                                children:
                                                    inputFieldValues.tags.map((String tag) {
                                                  return Container(
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20.0),
                                                      ),
                                                      color: Color.fromARGB(255, 74, 137, 92),
                                                    ),
                                                    margin: const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 10.0, vertical: 5.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        InkWell(
                                                          child: Text(
                                                            '#$tag',
                                                            style: const TextStyle(
                                                                color: Colors.white),
                                                          ),
                                                          onTap: () {
                                                            // print("$tag selected");
                                                          },
                                                        ),
                                                        const SizedBox(width: 4.0),
                                                        InkWell(
                                                          child: const Icon(
                                                            Icons.cancel,
                                                            size: 14.0,
                                                            color: Color.fromARGB(
                                                                255, 233, 233, 233),
                                                          ),
                                                          onTap: () {
                                                            inputFieldValues.onTagRemoved(tag);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }).toList()),
                                          ),
                                        )
                                      : null,
                                ),
                                onChanged: inputFieldValues.onTagChanged,
                                onSubmitted: inputFieldValues.onTagSubmitted,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _controller,
              child: Image.asset(
                'assets/page5.png', // Replace with your image path
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
