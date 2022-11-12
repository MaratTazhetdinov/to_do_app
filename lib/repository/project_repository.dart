import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/data/database_helper.dart';
import '../models/project_model.dart';

final projectRepositoryProvider = Provider((ref) => ProjectRepository.instance);

class ProjectRepository {
  ProjectRepository._();

  static final ProjectRepository _instance = ProjectRepository._();

  static ProjectRepository get instance => _instance;

  Future<List<Project>> get getProjects async {
    final db = DatabaseHelper.instance;
    final result = await db.getProjects();
    return result.map((e) => Project.fromJson(e)).toList();
  }

  Future<int> addProject(Project project) async {
    final db = DatabaseHelper.instance;
    return db.addProject(project);
  }

  Future<int> deleteProject(int id) async {
    final db = DatabaseHelper.instance;
    return db.deleteProject(id);
  }
}
