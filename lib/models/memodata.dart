import 'package:hive/hive.dart';
part 'memodata.g.dart';

@HiveType(typeId: 1)
class MemoData extends HiveObject{
  @HiveField(0)
  final String? text;

  MemoData({this.text});
}