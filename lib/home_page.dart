import 'package:desktop_app/pages/settings.dart';
import 'package:desktop_app/pages/tasks_bank.dart';
import 'package:desktop_app/pages/today_tasks.dart';
import 'package:desktop_app/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List todoList = [];

  // text controller for the dialog box
  final _controller = TextEditingController();


  void _navigateBottomBar(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  void saveNewTask() {
    print(_controller.text);
    Navigator.pop(context);
    setState(() {
      todoList.add(_controller.text);
    });
    print(todoList);
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  void createTask() {
    showDialog(context: context, builder: (context) => DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),
    ));
  }

  final List<Widget> _pages = [
    TasksBank(),
    TodayTasks(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
      ? FloatingActionButton(
        onPressed: createTask,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      )
      : null,
      bottomNavigationBar: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.deepPurple,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurpleAccent.shade200,
            gap: 4,
            onTabChange: _navigateBottomBar,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.list_rounded, text: 'Tasks'),
              GButton(icon: Icons.task_alt_rounded, text: 'Today'),
              GButton(icon: Icons.settings_rounded, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
