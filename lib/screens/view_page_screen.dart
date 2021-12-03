import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:notebook/components/edit_note_widget.dart';
import 'package:notebook/models/note_page.dart';
import 'package:notebook/utils/extensions.dart';

enum _ScreenMode { view, edit }

class ViewPageScreen extends StatefulWidget {
  static const String id = 'View Page Screen';
  const ViewPageScreen({Key? key}) : super(key: key);

  @override
  State<ViewPageScreen> createState() => _ViewPageScreenState();
}

class _ViewPageScreenState extends State<ViewPageScreen> {
  late final NotePage _page;
  _ScreenMode _screenMode = _ScreenMode.view;
  @override
  void didChangeDependencies() {
    _page = ModalRoute.of(context)!.settings.arguments as NotePage;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _screenMode == _ScreenMode.view
            ? [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _screenMode = _ScreenMode.edit;
                    });
                  },
                  icon: const Icon(Icons.edit),
                )
              ]
            : [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                )
              ],
      ),
      body: _screenMode == _ScreenMode.view
          ? Markdown(data: _page.note.safe)
          : EditNoteWidget(page: _page),
    );
  }
}
