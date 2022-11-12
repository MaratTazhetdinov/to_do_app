import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/widgets/custom_drawer.dart';
import 'package:to_do_app/widgets/custom_header.dart';
import 'package:to_do_app/widgets/main_list_view.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../models/project_model.dart';
import '../models/to_do_model.dart';
import '../repository/project_repository.dart';
import '../repository/to_do_repository.dart';
import '../widgets/project_list_view.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Todo>> todosList = ref.read(todoRepositoryProvider).getTodos;
    Future<List<Project>> projectsList =
        ref.read(projectRepositoryProvider).getProjects;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  AutoRouter.of(context).pushNamed('/search-page');
                },
                icon: Icon(Icons.search, color: Colors.black))
          ],
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              AutoRouter.of(context).pushNamed('/todo-page');
            },
            backgroundColor: AppTheme.colors.yellow,
            child: const Icon(Icons.add, color: Colors.black)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 32, top: 30, bottom: 30),
                  child: Text(
                    'Hello Marat! 👋',
                    style: TextStyle(
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                ),
              ),
              MainListView(todosList: todosList, ref: ref),
              SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              SliverToBoxAdapter(child: CustomHeader(label: "PROJECTS")),
              SliverToBoxAdapter(
                child: SizedBox(height: 14),
              ),
              ProjectListView(projectsList: projectsList, ref: ref)
            ],
          ),
        ));
  }
}
