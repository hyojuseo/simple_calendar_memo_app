import 'package:flutter/material.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/memo_list.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/memos.dart';

const TextStyle _titleStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30,
  fontStyle: FontStyle.italic,
);

class Memo extends StatelessWidget {
  final Function()? delete;

  const Memo({this.delete, Key? key}) : super(key: key);

  Widget _memoList(List<Memos> memos) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(memos.length, (index) {
          return MemoList(memo: memos[index], key: Key('${index}'),);
        }),
      ),
    );
  }

  Future<void> _addMemo(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AddDialog(
          title: '메모 추가',
          okCallback: () {
            print('내용: ${AddDialog.titleTemp!.text}');
            HiveHelper().create(Memos(text: AddDialog.titleTemp!.text));
            Navigator.of(context).pop();
          },
          cancelCallback: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Memos>>(
      future: HiveHelper().read(),
      builder: (context, snapshot) {
        List<Memos> memo = snapshot.data ?? [];
        print('메모 갯수: ${memo.length}');

        return Scaffold(
          appBar: AppBar(
            title: const Text('Memo', style: _titleStyle),
            centerTitle: true,
            elevation: 0,
          ),
          body: _memoList(memo),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen,
            child: const Icon(Icons.add),
            onPressed: () {
              _addMemo(context);
            },
          ),
        );
      },
    );
  }
}
