import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/widgets/app_bar_label.dart';
import 'package:to_do_app/widgets/to_do_list_view.dart';
import '../models/project_model.dart';
import '../theme/app_theme.dart';

// ignore: must_be_immutable
class TodoListPage extends ConsumerWidget {
  Project project;

  TodoListPage({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: AppTheme.colors.black),
          ),
          title: AppBarLabel(text: project.projectTitle),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              AutoRouter.of(context).pushNamed('/todo-page');
            },
            backgroundColor: AppTheme.colors.yellow,
            child: const Icon(Icons.add, color: Colors.black)),
        body: ExampleList(ref: ref));
  }
}
