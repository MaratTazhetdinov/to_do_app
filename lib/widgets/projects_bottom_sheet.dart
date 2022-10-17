import 'package:flutter/material.dart';

import '../models/project_model.dart';

// ignore: must_be_immutable
class ProjectBottomSheet extends StatelessWidget {
  final List<Project> projects;
  void Function()? onTap;

  ProjectBottomSheet({required this.projects, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index].name),
            onTap: onTap,
          );
        });
  }
}
