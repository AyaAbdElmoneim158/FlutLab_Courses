import 'package:flutter/material.dart';

class Code2StartCourse extends StatelessWidget {
  const Code2StartCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      home: const Center(
        child: Text("Code2StartCourse"),
      ),
    );
  }
}
