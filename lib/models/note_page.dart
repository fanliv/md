import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_page.g.dart';

@HiveType(typeId: 0)
class NotePage extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String note;

  const NotePage({
    this.title = '',
    this.note = '',
  });

  @override
  List<Object?> get props => [title, note];
}
