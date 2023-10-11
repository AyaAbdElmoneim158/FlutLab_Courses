import 'package:flutter/material.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/Abdullah_Mansour.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const AbdullahMansour();
  }
}
