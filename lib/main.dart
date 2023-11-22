import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_application/views/home_screen/home_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
