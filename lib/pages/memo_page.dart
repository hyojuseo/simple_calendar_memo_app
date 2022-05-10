import 'package:flutter/material.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/memo_list.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/memodata.dart';

const TextStyle _titleStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30,
  fontStyle: FontStyle.italic,
);

class MemoPage extends StatefulWidget {
  final Function()? delete;

  const MemoPage({this.delete, Key? key}) : super(key: key);

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  Widget _memoList(List<MemoData> memos) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(memos.length, (index) {
          return MemoList(
            memo: memos[index],
            key: Key('${index}'),
            onDeleted: () {
              setState(() {});
            },
          );
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
            setState(() {
              HiveHelper()
                  .memoCreate(MemoData(text: AddDialog.contentController!.text));
            });
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
    return FutureBuilder<List<MemoData>>(
      future: HiveHelper().memoRead(),
      builder: (context, snapshot) {
        List<MemoData> memo = snapshot.data ?? [];

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
