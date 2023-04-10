import 'package:hive/hive.dart';

part 'notesHive.g.dart';

@HiveType(typeId: 1)
class notesHive {
  notesHive({required this.title, required this.note});
  @HiveField(0)
  String title;

  @HiveField(1)
  String note;
}
