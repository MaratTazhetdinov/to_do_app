import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/models/project_model.dart';
import 'package:to_do_app/states/repository_state.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/to_do_list_page/to_do_list_page.dart';
import '../repository/project_repository.dart';
import '../repository/repository_manager.dart';

// ignore: must_be_immutable
class ProjectListView extends StatefulWidget {
  WidgetRef ref;
  Future<List<Project>> projectsList;

  ProjectListView({required this.ref, required this.projectsList});

  @override
  _ProjectListViewState createState() =>
      _ProjectListViewState(ref: ref, projectsList: projectsList);
}

// ignore: must_be_immutable
class _ProjectListViewState extends State<ProjectListView> {
  Future<List<Project>> projectsList;
  WidgetRef ref;

  _ProjectListViewState({required this.projectsList, required this.ref});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Project>>(
      future: ref.watch(repositoryManagerProvider) is! InitialRepositoryState
          ? ProjectRepository.instance.getProjects
          : projectsList,
      builder: (context, snapshot) {
        return SliverToBoxAdapter(
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            child: ListView.separated(
                addRepaintBoundaries: true,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                          child: Container(
                        color: AppTheme.colors.darkBlue,
                        height: 1,
                      )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 1,
                            color: AppTheme.colors.separatorColor,
                          ))
                    ],
                  );
                },
                itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                itemBuilder: (context, index) => Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) =>
                                _onDismissed(snapshot.data![index]),
                            backgroundColor: AppTheme.colors.separatorColor,
                            foregroundColor: Colors.red,
                            icon: Icons.delete,
                          )
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          AutoRouter.of(context).pushWidget(
                              TodoListPage(project: snapshot.data![index]));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                index == 0 || index == snapshot.data!.length - 1
                                    ? BorderRadius.only(
                                        topLeft: index == 0
                                            ? Radius.circular(6)
                                            : Radius.circular(0),
                                        topRight: index == 0
                                            ? Radius.circular(6)
                                            : Radius.circular(0),
                                        bottomLeft:
                                            index == snapshot.data!.length - 1
                                                ? Radius.circular(6)
                                                : Radius.circular(0),
                                        bottomRight:
                                            index == snapshot.data!.length - 1
                                                ? Radius.circular(6)
                                                : Radius.circular(0))
                                    : BorderRadius.zero),
                        tileColor: AppTheme.colors.darkBlue,
                        leading: Icon(Icons.circle,
                            color: Color(snapshot.data![index].projectColor)),
                        title: Text(snapshot.data![index].projectTitle),
                        trailing:
                            Text(snapshot.data![index].projectCount.toString()),
                        textColor: AppTheme.colors.white,
                      ),
                    )),
          ),
        );
      },
    );
  }

  void _onDismissed(Project project) {
    setState(() {
      ref.read(projectRepositoryProvider).deleteProject(project.projectID!);
      ref.read(repositoryManagerProvider.notifier).changedRepository();
    });
  }
}
