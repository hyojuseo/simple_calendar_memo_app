import 'package:hive/hive.dart';
part 'tododata.g.dart';

@HiveType(typeId: 0)
class TodoData extends HiveObject{
  @HiveField(0)
  final String? text;
  @HiveField(1)
  bool finished;

  TodoData({required this.text, this.finished = false});
}