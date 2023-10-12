// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/layout/todo_navbar.dart';

class AbdullahMansour extends StatelessWidget {
  const AbdullahMansour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      home: const TodoNavbar(),
    );
  }
}
