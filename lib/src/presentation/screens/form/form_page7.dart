import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  // Define boolean variables to track the state of each checkbox
  bool isNightShift = false;
  bool isDayShift = false;
  bool isWorkFromHome = false;
  bool isWorkFromOffice = false;
  bool isFieldJob = false;
  bool isFullTime = false;
  bool isPartTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Preferred Shifts Section
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Preferred Shifts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    CheckboxListTile(
                      title: const Text('Night Shift', style: TextStyle(fontSize: 14),),
                      value: isNightShift,
                      onChanged: (bool? value) {
                        setState(() {
                          isNightShift = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Day Shift', style: TextStyle(fontSize: 14),),
                      value: isDayShift,
                      onChanged: (bool? value) {
                        setState(() {
                          isDayShift = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              // Preferred Workplace Section
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Preferred Workplace', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    CheckboxListTile(
                      title: const Text('Work from Home', style: TextStyle(fontSize: 14),),
                      value: isWorkFromHome,
                      onChanged: (bool? value) {
                        setState(() {
                          isWorkFromHome = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Work from Office', style: TextStyle(fontSize: 14),),
                      value: isWorkFromOffice,
                      onChanged: (bool? value) {
                        setState(() {
                          isWorkFromOffice = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Field Job', style: TextStyle(fontSize: 14),),
                      value: isFieldJob,
                      onChanged: (bool? value) {
                        setState(() {
                          isFieldJob = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              // Preferred Employment Type Section
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Preferred Employment Type', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    CheckboxListTile(
                      title: const Text('Full Time', style: TextStyle(fontSize: 14),),
                      value: isFullTime,
                      onChanged: (bool? value) {
                        setState(() {
                          isFullTime = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Part Time', style: TextStyle(fontSize: 14),),
                      value: isPartTime,
                      onChanged: (bool? value) {
                        setState(() {
                          isPartTime = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
