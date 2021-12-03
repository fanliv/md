import 'package:flutter/material.dart';
import 'package:notebook/constants/constants.dart';
import 'package:notebook/constants/string.dart';
import 'package:notebook/models/note_page.dart';
import 'package:notebook/utils/hive_manager.dart';

class EditNoteWidget extends StatefulWidget {
  final NotePage? page;
  const EditNoteWidget({
    Key? key,
    this.page,
  }) : super(key: key);

  @override
  State<EditNoteWidget> createState() => _EditNoteWidgetState();
}

class _EditNoteWidgetState extends State<EditNoteWidget> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  late bool isCreating;
  Future<void> _createPage() async {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      await HiveManager.createPage(
        NotePage(
          title: _titleController.text,
          note: _noteController.text,
        ),
      );
    }
  }

  Future<void> _updatePage() async {
    final _pageIndex = HiveManager.pageIndex(widget.page!);
    await HiveManager.updatePage(
      index: _pageIndex,
      page: NotePage(
        title: _titleController.text,
        note: _noteController.text,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isCreating = widget.page == null;
    if (!isCreating) {
      _titleController.text = widget.page!.title;
      _noteController.text = widget.page!.note;
    }
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    if (isCreating) {
      await _createPage();
    } else {
      await _updatePage();
    }
    _titleController.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextField(
                  controller: _titleController,
                  maxLines: null,
                  style: kTitleTextStyle,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: AppText.title,
                    isDense: true,
                    border: InputBorder.none,
                    hintStyle: kTitleTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: TextField(
              controller: _noteController,
              maxLines: null,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: AppText.note,
                border: InputBorder.none,
                isDense: true,
              ),
              expands: true,
            ),
          ),
        )
      ],
    );
  }
}
