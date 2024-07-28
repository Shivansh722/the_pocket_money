import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/screens/form/form.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _durationInSeconds = 7;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Start the animation
    _controller.forward();

    Future.delayed(Duration(seconds: _durationInSeconds), () {
      // Navigate to the next screen after the delay
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FormPage())); // Replace NextScreen with your actual screen
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/logo.png', width: 280, height: 260),

                    Positioned(
                      top: 10,
                      right: 20,
                      child: AnimatedBuilder(
                        animation: _controller,
                        child: Image.asset('assets/mascot.png', width: 120, height: 110),
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _controller.value,
                            child: child,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Powered By House Stark',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
