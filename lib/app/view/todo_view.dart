import 'package:flutter/material.dart';
import 'package:todo_app_mvvm/app/viewModel/todo_view_model.dart';
import 'package:todo_app_mvvm/app/viewModel/widgets/floating_button.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    TodoViewModel controller = TodoViewModel();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 30, 30),
      appBar: AppBar(
        toolbarHeight: 72,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(34, 181, 173, 1),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Tarefas do dia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, child) {
                return const Row(
                  children: [],
                );
              },
            ),
          ),
          const FloatingButton(),
        ],
      ),
    );
  }
}
