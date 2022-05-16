import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_calendar/models/tododata.dart';
import 'package:todo_calendar/models/memodata.dart';

const String MEMO_BOX = 'MEMO_BOX';
const String TODO_BOX = 'TODO_BOX';
const String CAL_BOX = 'CAL_BOX';

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  factory HiveHelper() {
    return _singleton;
  }

  HiveHelper._internal();

  Box<MemoData>? memoBox;
  Box<TodoData>? todoBox;
  Box? calBox;

  Future openBox() async {
    memoBox = await Hive.openBox(MEMO_BOX);
    todoBox = await Hive.openBox(TODO_BOX);
    calBox = await Hive.openBox(CAL_BOX);
  }

  //memo crud
  Future memoCreate(MemoData newMemo) async {
    return memoBox!.add(newMemo);
  }

  Future<List<MemoData>> memoRead() async {
    return memoBox!.values.toList();
  }

  Future memoUpdate(int index, MemoData updatedMemo) async {
    memoBox!.putAt(index, updatedMemo);
  }

  Future memoDelete(int index) async {
    memoBox!.deleteAt(index);
  }

  //todo crud
  Future todoCreate(TodoData newTodo) async {
    return todoBox!.add(newTodo);
  }

  Future<List<TodoData>> todoRead() async {
    return todoBox!.values.toList();
  }

  Future todoUpdate(int index, TodoData updatedTodo) async {
    todoBox!.putAt(index, updatedTodo);
  }


  Future todoDelete(int index) async {
    todoBox!.deleteAt(index);
  }



  Future calCreate(DateTime dateTime, int state) async {
    String formatDate = DateFormat('yyyy-MM-dd').format(dateTime).toString();
    // print('datetime: ${formatDate},\n state: ${calBox!.get(formatDate)}');
    calBox!.put(formatDate, state);
    // print('calBoxKey: ${calBox!.keys}');
  }

  Future calRead() async {
    print('read에서의 calBox: ${calBox!.keys}');
    return calBox!.toMap();
  }

  Future calUpdate(int index, Map<dynamic, dynamic> updatedCal) async {
    calBox!.putAt(index, updatedCal);
  }

  Future calDelete(DateTime dateTime) async {
    String formatDate = DateFormat('yyyy-MM-dd').format(dateTime).toString();
    calBox!.delete(formatDate);
  }
}
