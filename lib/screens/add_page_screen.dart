import 'package:flutter/material.dart';
import 'package:notebook/components/edit_note_widget.dart';

class AddPageScreen extends StatelessWidget {
  static const String id = 'Add Page Screen';

  const AddPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const EditNoteWidget(),
    );
  }
}
