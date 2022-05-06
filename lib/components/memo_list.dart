import 'package:flutter/material.dart';
import 'package:todo_calendar/models/memodata.dart';

class MemoList extends StatefulWidget {
  final MemoData? memo;
  final Function? onDeleted;

  const MemoList({this.memo, this.onDeleted, Key? key}) : super(key: key);

  @override
  State<MemoList> createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: widget.key,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.memo!.text.toString(),
                //'오늘점심밥메뉴는뭘로정할지참고민되는데말입니다.',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.memo!.delete();
                  widget.onDeleted!();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
