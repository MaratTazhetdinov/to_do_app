import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/project_model.dart';

final projectRepositoryProvider = Provider((ref) => ProjectRepository());

class ProjectRepository {
  final projectList = [
    Project(name: 'Personal', color: Colors.yellow),
    Project(name: 'Work', color: Colors.orange),
    Project(name: 'Design', color: Colors.purple),
    Project(name: 'Study', color: Colors.green)
  ];

  void addProject(Project project) {
    projectList.add(project);
  }
}
