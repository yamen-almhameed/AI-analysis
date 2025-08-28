import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundPrimary,
        appBar: AppBar(title: Text('Calendar')),
        body: Center(child: Text('Welcome to the Calendar Screen!')),
      ),
    );
  }
}
