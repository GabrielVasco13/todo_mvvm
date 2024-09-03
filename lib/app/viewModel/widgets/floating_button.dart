import 'package:flutter/material.dart';
import 'package:todo_app_mvvm/app/model/todo_model.dart';
import 'package:todo_app_mvvm/app/viewModel/todo_view_model.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    TodoViewModel controller = TodoViewModel();

    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            controller.postTodo(
              TodoModel(
                title: 'Nova tarefa',
                isDone: false,
              ),
            );
          },
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            const CircleBorder(),
            0.5,
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
