import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:to_do_app/data/database_helper.dart';
import '../models/to_do_model.dart';

final todoRepositoryProvider = Provider((ref) => TodoRepository.instance);

class TodoRepository {
  TodoRepository._();

  static final TodoRepository _instance = TodoRepository._();

  static TodoRepository get instance => _instance;

  Future<List<Todo>> get getTodos async {
    final db = DatabaseHelper.instance;
    final result = await db.getTodos();
    return result.map((e) => Todo.fromJson(e)).toList();
  }

  Future<int> addTodo(Todo todo) async {
    final db = DatabaseHelper.instance;
    return db.addTodo(todo);
  }

  Future<int> deleteTodo(int id) async {
    final db = DatabaseHelper.instance;
    return db.deleteTodo(id);
  }

  Future<void> changeTodoCompletion(Todo todo) async {
    final db = DatabaseHelper.instance;
    return db.changeTodoCompletion(todo);
  }
}
