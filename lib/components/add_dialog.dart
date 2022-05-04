import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final String? title;
  final Function()? okCallback;
  final Function()? cancelCallback;
  static TextEditingController? titleTemp;

  const AddDialog({
    Key? key,
    required this.title,
    this.okCallback,
    this.cancelCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? contentController = TextEditingController();

    return AlertDialog(
      title: Text(
        title!,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: contentController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: '내용을 입력하세요',
          //border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 5, bottom: 10),
          isDense: true,
        ),
        onSubmitted: (String? text) {
          contentController.text = text!;
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: okCallback,
          child: const Text('추가'),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
        ElevatedButton(
          onPressed: cancelCallback,
          child: const Text('취소'),
          style: ElevatedButton.styleFrom(primary: Colors.grey),
        ),
      ],
    );
  }
}
