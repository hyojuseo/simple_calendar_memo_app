import 'package:hive/hive.dart';
part 'caldata.g.dart';

@HiveType(typeId: 0)
class CalData extends HiveObject{
  @HiveField(0)
  final String? text;
  @HiveField(1)
  bool finished;

  CalData({required this.text, this.finished = false});
}

// class CalData{
//   final String? text;
//   bool finished = false;
//
//   CalData({this.text, this.finished = false});
// }