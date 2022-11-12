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
        'CREATE TABLE IF NOT EXISTS project(projectID INTEGER PRIMARY KEY AUTOINCREMENT, projectTitle TEXT NOT NULL, projectColor INT NOT NULL, projectCount INTEGER)');
    db.execute(
        'CREATE TABLE IF NOT EXISTS todo(todoID INTEGER PRIMARY KEY AUTOINCREMENT, todoTask TEXT NOT NULL, todoDate TEXT, todoCompletion INTEGER NOT NULL, projectID INTEGER, FOREIGN KEY (projectID) REFERENCES project(projectID))');
    db.execute(
        'INSERT INTO project (projectTitle, projectColor) VALUES ("Inbox", 0)');
  }

  Future<List<Map<String, Object?>>> getTodos() async {
    final db = await instance._database;
    return db.rawQuery(
        'SELECT todo.todoID, todo.todoTask, todo.todoDate, todo.todoCompletion, todo.projectID, project.projectTitle, project.projectColor FROM todo INNER JOIN project ON project.projectID=todo.projectID WHERE todo.todoCompletion!=1');
  }

  Future<List<Map<String, Object?>>> getProjects() async {
    final db = await instance._database;
    return db.rawQuery(
        'SELECT p.*, q.projectCount FROM project p LEFT JOIN (SELECT COUNT(*) projectCount, projectID from todo where projectID > 1 and todoCompletion != 1 group by projectID) Q ON p.projectID = q.projectID WHERE p.projectID > 1');
  }

  Future<int> addTodo(Todo todo) async {
    final db = await instance._database;
    return db.rawInsert(
        'INSERT INTO todo(todoTask, todoDate, todoCompletion, projectID) VALUES ("${todo.todoTask}", "${todo.todoDate}", ${todo.todoCompletion}, ${todo.projectID})');
  }

  Future<int> addProject(Project project) async {
    final db = await instance._database;
    return db.rawInsert(
        'INSERT INTO project(projectTitle, projectColor) VALUES ("${project.projectTitle}", ${project.projectColor})');
  }

  Future<int> deleteTodo(int id) async {
    final db = await instance._database;
    return db.rawDelete('DELETE FROM todo WHERE todoID=?', [id]);
  }

  Future<int> deleteProject(int id) async {
    final db = await instance._database;
    db.rawDelete('DELETE FROM todo WHERE projectID=?', [id]);
    return db.rawDelete('DELETE FROM project WHERE projectID=?', [id]);
  }

  Future<void> changeTodoCompletion(Todo todo) async {
    final db = await instance._database;
    db.execute(
        todo.todoCompletion == 0
            ? 'UPDATE todo SET todoCompletion=1 WHERE todoID=?'
            : 'UPDATE todo SET todoCompletion=0 WHERE todoID=?',
        [todo.todoID]);
  }
}
