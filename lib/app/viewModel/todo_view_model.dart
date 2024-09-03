import 'package:flutter/material.dart';
import 'package:todo_app_mvvm/app/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void postTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void putTodo(TodoModel toDoIndex, TodoModel newTodo) {
    int index = _todos.indexOf(toDoIndex);
    if (index != -1) {
      if (newTodo.isDone) {
        newTodo.isDone = true;
      }
      _todos[index] = newTodo;
    }
    notifyListeners();
  }

  List<TodoModel> getTodos() {
    return _todos;
  }
}
