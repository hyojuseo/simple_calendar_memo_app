import 'package:hive/hive.dart';
import 'package:todo_calendar/models/memos.dart';

const String MEMO_BOX = 'MEMO_BOX';

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  factory HiveHelper(){
    return _singleton;
  }

  HiveHelper._internal();

  Box<Memos>? memoBox;

  //crud
  Future openBox() async {
    memoBox = await Hive.openBox(MEMO_BOX);
  }
  Future create(Memos newMemos) async{
    return memoBox!.add(newMemos);
  }
  Future<List<Memos>> read() async{
    return memoBox!.values.toList();
  }
  Future update(int index, Memos updatedMemos) async{
    memoBox!.putAt(index, updatedMemos);
  }
  Future delete(int index) async{
    memoBox!.deleteAt(index);
  }


}