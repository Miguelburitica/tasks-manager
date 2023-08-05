import 'package:flutter/material.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Today tasks',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        )
      ),
    );
  }
}