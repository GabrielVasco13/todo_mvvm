import 'package:dio/dio.dart';
import 'package:todo_app_mvvm/app/model/todo_model.dart';

class TodoService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://localhost:3000',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await _dio.get('/todos');
      List data = response.data;
      return data.map((json) => TodoModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoModel> addTodo(TodoModel todo) async {
    try {
      final response = await _dio.post('/todos', data: todo.toJson());
      final data = response.data;
      return TodoModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to add todo');
    }
  }

  Future<TodoModel> updateTodo(TodoModel todo) async {
    try {
      final response = await _dio.put('/todos/${todo.id}', data: todo.toJson());
      final data = response.data;
      return TodoModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _dio.delete('/todos/$id');
    } catch (e) {
      throw Exception('Failed to delete todo');
    }
  }
}
