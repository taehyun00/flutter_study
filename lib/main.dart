import 'package:flutter/material.dart';
import 'package:flutter_project_1/view/todo_list_view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home :TodoListView()
    );
  }
}