import 'package:flutter/material.dart';

const TextStyle _listStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

class TodoList extends StatelessWidget {
  final String? text;
  final String? content;
  final Function()? delete;

  const TodoList({
    Key? key,
    required this.text,
    this.content,
    this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text!,
            //controller.selectedDay.value.toString(),
            style: _listStyle,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(20, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Flexible 줄바꿈
                          Flexible(
                            child: Text(
                              content!,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),

                          IconButton(
                            onPressed: delete,
                            icon: const Icon(Icons.delete, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
