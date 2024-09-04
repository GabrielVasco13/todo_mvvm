import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final bool isChecked;
  final VoidCallback onPressed;
  final Function(String) submit;

  const TaskItemWidget({
    super.key,
    required this.index,
    required this.title,
    required this.isChecked,
    required this.onPressed,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              height: 100,
              width: double.infinity,
              child: TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  submit(value);
                  Navigator.of(context).pop();
                },
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Atualize a sua tarefa',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                isChecked
                    ? Icons.check_circle_outline_rounded
                    : Icons.circle_outlined,
                color: Colors.white,
              ),
              onPressed: onPressed),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
