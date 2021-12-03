import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notebook/models/note_page.dart';
import 'package:notebook/screens/add_page_screen.dart';
import 'package:notebook/screens/view_page_screen.dart';
import 'package:notebook/utils/hive_manager.dart';
import 'package:notebook/utils/extensions.dart';

class PagesScreen extends StatefulWidget {
  static const String id = 'Pages Screen';
  const PagesScreen({Key? key}) : super(key: key);

  @override
  State<PagesScreen> createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  List<NotePage> get pages => HiveManager.pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, AddPageScreen.id);
          setState(() {
            print(pages.length);
          });
        },
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final _page = pages[index];
          return ListTile(
            title: Text(_page.title.safe),
            onTap: () async {
              await Navigator.pushNamed(
                context,
                ViewPageScreen.id,
                arguments: _page,
              );
              setState(() {
                pages;
              });
            },
          );
        },
      ),
    );
  }
}
