import 'package:flutter/material.dart';

class AbdullahMansourCourse extends StatelessWidget {
  const AbdullahMansourCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      home: const Center(
        child: Text("AbdullahMansourCourse"),
      ),
    );
  }
}
