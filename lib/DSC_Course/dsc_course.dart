import 'package:flutter/material.dart';

class DscCourse extends StatelessWidget {
  const DscCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      home: const Center(
        child: Text("DscCourse"),
      ),
    );
  }
}
