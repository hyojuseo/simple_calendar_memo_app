import 'package:hive/hive.dart';
part 'caldata.g.dart';

@HiveType(typeId: 2)
class CalData extends HiveObject{
  @HiveField(0)
  int? checkState;

  CalData({this.checkState});
}