import 'package:hive/hive.dart';
import 'package:todo_calendar/models/caldata.dart';
import 'package:todo_calendar/models/memodata.dart';

const String MEMO_BOX = 'MEMO_BOX';
const String CAL_BOX = 'CAL_BOX';

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  factory HiveHelper(){
    return _singleton;
  }

  HiveHelper._internal();

  Box<MemoData>? memoBox;
  Box<CalData>? calBox;

  Future openBox() async {
    memoBox = await Hive.openBox(MEMO_BOX);
    calBox = await Hive.openBox(CAL_BOX);
  }


  //memo crud
  Future memoCreate(MemoData newMemo) async{
    return memoBox!.add(newMemo);
  }
  Future<List<MemoData>> memoRead() async{
    return memoBox!.values.toList();
  }
  Future memoUpdate(int index, MemoData updatedMemo) async{
    memoBox!.putAt(index, updatedMemo);
  }
  Future memoDelete(int index) async{
    memoBox!.deleteAt(index);
  }


  //cal_todo crud
  Future calCreate(CalData newTodo) async{
    return calBox!.add(newTodo);
  }

  Future<List<CalData>> calRead() async{
    return calBox!.values.toList();
  }
  Future calUpdate(int index, CalData updatedTodo) async{
    calBox!.putAt(index, updatedTodo);
  }
  Future calDelete(int index) async{
    calBox!.deleteAt(index);
  }

}