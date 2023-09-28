import 'package:flutter/material.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/ismail_elmogy_app.dart';
import 'package:flutter_courses/02.Ismail_Elmogy/clean_architecture/quote_app/injector.dart'
    as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const IsmailElmogyApp();
  }
}
