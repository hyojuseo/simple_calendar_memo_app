import 'package:flutter/material.dart';
import 'package:todo_calendar/models/memos.dart';

class MemoList extends StatelessWidget {
  final Memos? memo;
  //final int? keyIndex;

  const MemoList({this.memo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
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
                memo!.text.toString(),
                //'오늘점심밥메뉴는뭘로정할지참고민되는데말입니다.',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
                onPressed: () {
                  memo!.delete();
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
