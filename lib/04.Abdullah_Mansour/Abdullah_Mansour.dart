import 'package:flutter/material.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/login_design.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/messanger_screen.dart';

class AbdullahMansour extends StatelessWidget {
  const AbdullahMansour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      home: const MessangerDesign(),
    );
  }
}
