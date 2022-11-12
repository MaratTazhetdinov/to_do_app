import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/project_add_page/project_add_page_manager.dart';
import 'package:to_do_app/states/add_state.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/widgets/project_list_view.dart';
import '../models/project_model.dart';
import '../repository/project_repository.dart';
import '../widgets/app_bar_label.dart';

// ignore: must_be_immutable
class ProjectListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Project>> projectsList =
        ref.read(projectRepositoryProvider).getProjects;

    // ref.listen<AddState>(projectAddPageManagerProvider, ((previous, next) {
    //   print(previous.runtimeType);
    //   print(next.runtimeType);
    //   if (next is AddSuccessfulState) {
    //     print('Added');
    //     projectsList = ProjectRepository.instance.getProjects;
    //   }
    // }));

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  AutoRouter.of(context).pushNamed('/project-add-page');
                },
                icon: Icon(Icons.add, color: AppTheme.colors.black))
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: AppTheme.colors.black),
          ),
          title: AppBarLabel(text: 'Projects'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 32),
              ),
              ProjectListView(projectsList: projectsList, ref: ref)
            ],
          ),
        ));
  }
}
