import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/screens/home/the_og_home_page.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            Image.asset('assets/submit1.gif', width: 300, height: 250),
            const SizedBox(height: 80),
            const Text(
              'Congratulations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Your profile is successfully created',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 120),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                textAlign: TextAlign.center,
                'Pro-tip: Keep updating your profile to get more calls from HRs',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const StudentHomePage()));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('Proceed', style: TextStyle(color:Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
