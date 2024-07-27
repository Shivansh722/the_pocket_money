import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class Page8 extends StatefulWidget {
  const Page8({super.key});

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  late double _distanceToField;
  late StringTagController _stringTagController;

  final List<String> suggestedSkills = [
    'Driver',
    'Logistics',
    'Construction - Labor/Factory worker',
    'Home Helper',
    'Cleaning',
    'Delivery',
    'Security Services'
    // Add more skills as needed
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What job title/role are you looking for?.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'You can select up to 5 job roles',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            labelText: 'Enter job title/role',
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            isDense: true,
                            border: const OutlineInputBorder(),
                            errorText: inputFieldValues.error,
                            prefixIconConstraints:
                                BoxConstraints(maxWidth: _distanceToField * 0.8),
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
                                                color:
                                                    Color.fromARGB(255, 74, 137, 92),
                                              ),
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10.0, vertical: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                      inputFieldValues
                                                          .onTagRemoved(tag);
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _stringTagController.clearTags();
                          });
                        },
                        child: const Text(
                          'Clear All',
                          style: TextStyle(color: Color.fromARGB(255, 74, 137, 92)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Suggested job titles/roles', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 15,
                      runSpacing: 4,
                      children: suggestedSkills.map((skill) {
                        return InputChip(
                          label: Text(skill),
                          onPressed: () {
                            setState(() {
                              if (!_stringTagController.getTags!.contains(skill)) {
                                _stringTagController.addTag(skill);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
