import 'package:flutter/material.dart';

const TextStyle _titleStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30,
  fontStyle: FontStyle.italic,
);

class Memo extends StatelessWidget {
  const Memo({Key? key}) : super(key: key);

  Future<void> _addMemo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '메모 추가',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: '내용을 입력하세요',
            ),
            onSubmitted: (String text) {},
          ),
        );
      },
    );
  }

  Widget _memoList() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '매일 할일들',
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo', style: _titleStyle),
        centerTitle: true,
        elevation: 0,
        //backgroundColor: Colors.lightGreen,
      ),
      body: _memoList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          _addMemo(context);
        },
      ),
    );
  }
}
