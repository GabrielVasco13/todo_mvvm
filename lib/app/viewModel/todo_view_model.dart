import 'package:flutter/material.dart';
import 'package:todo_app_mvvm/app/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void postTodo(String title) {
    _todos.add(TodoModel(title: title, isChecked: false));
    notifyListeners();
  }

  void deleteTodo(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void putTodo(int index, String title) {
    if (index != -1) {
      _todos[index] =
          TodoModel(title: title, isChecked: _todos[index].isChecked);
    }
    notifyListeners();
  }

  void checked(int id) {
    _todos[id].isChecked = !_todos[id].isChecked;
    notifyListeners();
  }
}
