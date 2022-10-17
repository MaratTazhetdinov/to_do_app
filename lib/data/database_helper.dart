import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/models/project_model.dart';
import 'package:to_do_app/models/to_do_model.dart';

const dbVersion = 1;

class DatabaseHelper {
  DatabaseHelper._();

  static DatabaseHelper _instance = DatabaseHelper._();

  static DatabaseHelper get instance => _instance;

  static Database? _databaseInstance;

  Future<Database> get _database async =>
      _databaseInstance ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'todo_database.db');
    return openDatabase(
      path,
      version: dbVersion,
      onCreate: _onCreateDatabase,
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    db.execute(
        'CREATE TABLE IF NOT EXISTS project(projectID INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, color TEXT)'
        'CREATE TABLE IF NOT EXISTS todo(todoID INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT NOT NULL, date INTEGER, projectID INTEGER, FOREIGN KEY (projectID) REFERENCES project (projectID))');
  }

  Future<List<ToDo>> getTodos() async {
    final db = await instance._database;
    final result = await db.rawQuery(
        'SELECT t.todoID, t.task, t.date, p.title FROM todo t INNER JOIN project p ON p.projectID=t.projectID');
    return result.map((e) => ToDo.fromJson(e)).toList();
  }

  Future<List<Project>> getProjects() async {
    final db = await instance._database;
    final result = await db.rawQuery('SELECT * FROM project');
    return result.map((e) => Project.fromJson(e)).toList();
  }

  Future<int> addTodo(ToDo todo) async {
    final db = await instance._database;
    return db.insert(
      'todo',
      {
        'task': todo.task,
        'date': todo.date,
        'projectType': todo.projectType
      }
    );
  }
}
