import 'package:flutter/material.dart';

class NotebooksScreen extends StatefulWidget {
  const NotebooksScreen({Key? key}) : super(key: key);

  @override
  _NotebooksScreenState createState() => _NotebooksScreenState();
}

class _NotebooksScreenState extends State<NotebooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Section 1'),
            onTap: () {
              //TODO go to sections screen
            },
          )
        ],
      ),
    );
  }
}
