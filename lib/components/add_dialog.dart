import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  final String? title;
  final Function()? okCallback;
  final Function()? cancelCallback;
  static TextEditingController? contentController;

  AddDialog({
    Key? key,
    required this.title,
    this.okCallback,
    this.cancelCallback,
  }) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    AddDialog.contentController = TextEditingController();

    return AlertDialog(
      title: Text(
        widget.title!,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: AddDialog.contentController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: '내용을 입력하세요',
          contentPadding: EdgeInsets.only(left: 5, bottom: 10),
          isDense: true,
        ),
        onSubmitted: (String text) {
          AddDialog.contentController!.text = text;
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: widget.okCallback,
          child: const Text('추가'),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
        ElevatedButton(
          onPressed: widget.cancelCallback,
          child: const Text('취소'),
          style: ElevatedButton.styleFrom(primary: Colors.grey),
        ),
      ],
    );
  }
}
