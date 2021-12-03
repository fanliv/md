import 'package:hive_flutter/hive_flutter.dart';
import 'package:notebook/models/note_page.dart';
import 'package:notebook/utils/extensions.dart';

enum BoxKey { noteBooks }

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NotePageAdapter());
    await Hive.openBox<NotePage>(BoxKey.noteBooks.text);
  }

  static get _noteBooksBox => Hive.box<NotePage>(BoxKey.noteBooks.text);

  static Future<void> createPage(NotePage page) async {
    await _noteBooksBox.add(page);
  }

  static List<NotePage> get pages => _noteBooksBox.values.toList().revered.;

static void test(){
  _noteBooksBox.values
}
  static void clearAll() {
    _noteBooksBox.clear();
  }

  static int pageIndex(NotePage page) {
    return pages.indexOf(page);
  }

  static Future<void> updatePage(
      {required int index, required NotePage page}) async {
    await _noteBooksBox.putAt(index, page);
  }
}
