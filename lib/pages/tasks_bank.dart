import 'package:flutter/material.dart';

class TasksBank extends StatelessWidget {
  const TasksBank({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tasks Bank',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        )
      ),
    );
  }
}