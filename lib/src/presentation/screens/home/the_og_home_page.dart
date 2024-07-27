import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/appbar.dart';
import 'package:pocket_money/src/presentation/widgets/home_student_widgetss/drawer.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  const Scaffold(
    appBar: CustomAppBar(),
    drawer: HomeStudentDrawer(),
    );
  }
}