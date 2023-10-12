// ignore: file_names
import 'package:flutter/material.dart';
import './modules/messenger/messenger_screen.dart';

class AbdullahMansour extends StatelessWidget {
  const AbdullahMansour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.dark,
      home: const MessengerDesign(),
    );
  }
}
