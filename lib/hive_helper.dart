import 'package:hive/hive.dart';
import 'package:todo_calendar/models/memodata.dart';

const String MEMO_BOX = 'MEMO_BOX';

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  factory HiveHelper(){
    return _singleton;
  }

  HiveHelper._internal();

  Box<MemoData>? memoBox;

  //crud
  Future openBox() async {
    memoBox = await Hive.openBox(MEMO_BOX);
  }
  Future create(MemoData newMemos) async{
    return memoBox!.add(newMemos);
  }
  Future<List<MemoData>> read() async{
    return memoBox!.values.toList();
  }
  Future update(int index, MemoData updatedMemos) async{
    memoBox!.putAt(index, updatedMemos);
  }
  Future delete(int index) async{
    memoBox!.deleteAt(index);
  }


}