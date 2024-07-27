import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String? selectedOption;
  String? selectedEducationLevel;

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
      selectedEducationLevel = null; // Reset the selected education level when changing the option
    });
  }

  void _selectEducationLevel(String level) {
    setState(() {
      selectedEducationLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      '10th or Below 10th',
      '12th Pass',
      'Diploma',
      'ITI',
      'Graduate',
      'Post Graduate'
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Are you still pursuing your education?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () => _selectOption('Yes'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedOption == 'Yes'
                                  ? Colors.black
                                  : Colors.white,
                              foregroundColor: selectedOption == 'Yes'
                                  ? Colors.white
                                  : Colors.black,
                              side: const BorderSide(color: Colors.black, width: 1),
                            ),
                            child: const Text('Yes'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => _selectOption('No'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedOption == 'No'
                                  ? Colors.black
                                  : Colors.white,
                              foregroundColor: selectedOption == 'No'
                                  ? Colors.white
                                  : Colors.black,
                              side: const BorderSide(color: Colors.black, width: 1),
                            ),
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (selectedOption == 'Yes') ...[
                Card(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'What are you currently pursuing?',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: options.map((option) {
                              return ElevatedButton(
                                onPressed: () {
                                  _selectEducationLevel(option);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedEducationLevel == option
                                      ? Colors.black
                                      : Colors.white,
                                  foregroundColor: selectedEducationLevel == option
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                child: Text(option),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (selectedEducationLevel != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (selectedEducationLevel == '10th or Below 10th') ...[
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'School Medium',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                3,
                                (index) => DropdownMenuItem(
                                  value: ['English', 'Hindi', 'Other'][index],
                                  child: Text(['English', 'Hindi', 'Other'][index]),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'School Board',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                3,
                                (index) => DropdownMenuItem(
                                  value: ['CBSE', 'ICSE', 'State Board'][index],
                                  child: Text(['CBSE', 'ICSE', 'State Board'][index]),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Year of Passing',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                  value: (2024 - index).toString(),
                                  child: Text((2024 - index).toString()),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ],


                          if (selectedEducationLevel == '12th Pass') ...[
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'School Medium',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                3,
                                (index) => DropdownMenuItem(
                                  value: ['English', 'Hindi', 'Other'][index],
                                  child: Text(['English', 'Hindi', 'Other'][index]),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'School Board',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                3,
                                (index) => DropdownMenuItem(
                                  value: ['CBSE', 'ICSE', 'State Board'][index],
                                  child: Text(['CBSE', 'ICSE', 'State Board'][index]),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Year of Passing',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                  value: (2024 - index).toString(),
                                  child: Text((2024 - index).toString()),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ],
                          if (selectedEducationLevel == 'Diploma') ...[
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Diploma Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Specialization',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'Science', child: Text('Science')),
                                DropdownMenuItem(value: 'Commerce', child: Text('Commerce')),
                                DropdownMenuItem(value: 'Arts', child: Text('Arts')),
                                DropdownMenuItem(value: 'Engineering', child: Text('Engineering')),
                                DropdownMenuItem(value: 'Management', child: Text('Management')),
                                DropdownMenuItem(value: 'Law', child: Text('Law')),
                                DropdownMenuItem(value: 'Medicine', child: Text('Medicine')),
                                DropdownMenuItem(value: 'Computer Science', child: Text('Computer Science')),
                                DropdownMenuItem(value: 'Information Technology', child: Text('Information Technology')),
                                DropdownMenuItem(value: 'Humanities', child: Text('Humanities')),
                                DropdownMenuItem(value: 'Social Sciences', child: Text('Social Sciences')),
                              ],
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Completion Year (or Expected)',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                  value: (2024 - index).toString(),
                                  child: Text((2024 - index).toString()),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Institute Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],


                          if (selectedEducationLevel == 'ITI') ...[
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Course Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Completion Year (or Expected)',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                  value: (2024 - index).toString(),
                                  child: Text((2024 - index).toString()),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Institute Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],


                          if (selectedEducationLevel == 'Graduate') ...[
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Degree',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'M.Sc', child: Text('M.Sc')),
                                DropdownMenuItem(value: 'M.Com', child: Text('M.Com')),
                                DropdownMenuItem(value: 'B.Com', child: Text('B.Com')),
                                DropdownMenuItem(value: 'M.A', child: Text('M.A')),
                                DropdownMenuItem(value: 'M.Tech', child: Text('M.Tech')),
                                DropdownMenuItem(value: 'B.Tech', child: Text('B.Tech')),
                                DropdownMenuItem(value: 'B.Sc', child: Text('B.Sc')),
                                DropdownMenuItem(value: 'MBA', child: Text('MBA')),
                                DropdownMenuItem(value: 'MCA', child: Text('MCA')),
                                DropdownMenuItem(value: 'LLM', child: Text('LLM')),
                                DropdownMenuItem(value: 'MD', child: Text('MD')),
                              ],
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Specialization',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'Science', child: Text('Science')),
                                DropdownMenuItem(value: 'Commerce', child: Text('Commerce')),
                                DropdownMenuItem(value: 'Arts', child: Text('Arts')),
                                DropdownMenuItem(value: 'Engineering', child: Text('Engineering')),
                                DropdownMenuItem(value: 'Management', child: Text('Management')),
                                DropdownMenuItem(value: 'Law', child: Text('Law')),
                                DropdownMenuItem(value: 'Medicine', child: Text('Medicine')),
                                DropdownMenuItem(value: 'Computer Science', child: Text('Computer Science')),
                                DropdownMenuItem(value: 'Information Technology', child: Text('Information Technology')),
                                DropdownMenuItem(value: 'Humanities', child: Text('Humanities')),
                                DropdownMenuItem(value: 'Social Sciences', child: Text('Social Sciences')),
                              ],
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Completion Year (or Expected)',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                  value: (2024 - index).toString(),
                                  child: Text((2024 - index).toString()),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'College Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],

              
                          if (selectedEducationLevel == 'Post Graduate') ...[
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Degree',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'M.Sc', child: Text('M.Sc')),
                                DropdownMenuItem(value: 'M.Com', child: Text('M.Com')),
                                DropdownMenuItem(value: 'B.Com', child: Text('B.Com')),
                                DropdownMenuItem(value: 'M.A', child: Text('M.A')),
                                DropdownMenuItem(value: 'M.Tech', child: Text('M.Tech')),
                                DropdownMenuItem(value: 'B.Tech', child: Text('B.Tech')),
                                DropdownMenuItem(value: 'B.Sc', child: Text('B.Sc')),
                                DropdownMenuItem(value: 'MBA', child: Text('MBA')),
                                DropdownMenuItem(value: 'MCA', child: Text('MCA')),
                                DropdownMenuItem(value: 'LLM', child: Text('LLM')),
                                DropdownMenuItem(value: 'MD', child: Text('MD')),
                              ],
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Specialization',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'Science', child: Text('Science')),
                                DropdownMenuItem(value: 'Commerce', child: Text('Commerce')),
                                DropdownMenuItem(value: 'Arts', child: Text('Arts')),
                                DropdownMenuItem(value: 'Engineering', child: Text('Engineering')),
                                DropdownMenuItem(value: 'Management', child: Text('Management')),
                                DropdownMenuItem(value: 'Law', child: Text('Law')),
                                DropdownMenuItem(value: 'Medicine', child: Text('Medicine')),
                                DropdownMenuItem(value: 'Computer Science', child: Text('Computer Science')),
                                DropdownMenuItem(value: 'Information Technology', child: Text('Information Technology')),
                                DropdownMenuItem(value: 'Humanities', child: Text('Humanities')),
                                DropdownMenuItem(value: 'Social Sciences', child: Text('Social Sciences')),
                              ],
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Completion Year (or Expected)',
                                border: OutlineInputBorder(),
                              ),
                              items: List.generate(
                                10,
                                (index) => DropdownMenuItem(
                                  value: (2024 - index).toString(),
                                  child: Text((2024 - index).toString()),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'College Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
