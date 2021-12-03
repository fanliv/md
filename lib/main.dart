import 'package:flutter/material.dart';
import 'package:notebook/screens/add_page_screen.dart';
import 'package:notebook/screens/pages_screen.dart';
import 'package:notebook/screens/view_page_screen.dart';
import 'package:notebook/utils/hive_manager.dart';

Future<void> main() async {
  await HiveManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notebooks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        ViewPageScreen.id: (context) => const ViewPageScreen(),
        PagesScreen.id: (context) => PagesScreen(),
        AddPageScreen.id: (context) => const AddPageScreen(),
      },
      initialRoute: PagesScreen.id,
    );
  }
}
