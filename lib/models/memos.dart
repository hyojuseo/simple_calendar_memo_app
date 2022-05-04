import 'package:hive/hive.dart';
part 'memos.g.dart';

@HiveType(typeId: 0)
class Memos extends HiveObject{
  @HiveField(0)
  final String? text;

  Memos({this.text});

}