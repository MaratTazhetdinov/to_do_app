import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/models/project_model.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/project_add_page/project_add_page_manager.dart';
import 'package:to_do_app/repository/to_do_repository.dart';
import 'package:to_do_app/states/add_state.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/to_do_add_page/project_state_manager.dart';
import 'package:to_do_app/to_do_list_page/to_do_list_page.dart';
import '../repository/project_repository.dart';

// ignore: must_be_immutable
class ProjectListViewBottomSheet extends ConsumerWidget {
  WidgetRef ref;

  ProjectListViewBottomSheet({required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Project>>(
      future: ProjectRepository.instance.getProjects,
      builder: (context, snapshot) {
        return ListView.separated(
            addRepaintBoundaries: true,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Row(
                children: index == 0
                    ? [
                        Expanded(
                            child: Container(
                          color: Colors.transparent,
                          height: 1,
                        )),
                        Expanded(
                            flex: 9,
                            child: Container(
                              height: 1,
                              color: AppTheme.colors.separatorColor,
                            ))
                      ]
                    : [
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: AppTheme.colors.darkBlue,
                              height: 1,
                            )),
                        Expanded(
                            flex: 8,
                            child: Container(
                              height: 1,
                              color: AppTheme.colors.separatorColor,
                            ))
                      ],
              );
            },
            itemCount: snapshot.data == null ? 1 : snapshot.data!.length + 1,
            itemBuilder: (context, index) => InkWell(
                  onTap: index == 0
                      ? () {
                          ref
                              .read(projectStateManagerProvider.notifier)
                              .projectChanged(Project(
                                  projectID: 1,
                                  projectTitle: 'Inbox',
                                  projectColor: 0));
                          Navigator.of(context).pop();
                        }
                      : () {
                          ref
                              .read(projectStateManagerProvider.notifier)
                              .projectChanged(snapshot.data![index - 1]);
                          Navigator.of(context).pop();
                        },
                  child: index == 0
                      ? Container(
                          height: 52,
                          color: AppTheme.colors.darkBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 21),
                              SvgPicture.asset('assets/inbox_icon.svg'),
                              SizedBox(width: 9),
                              Text('Inbox',
                                  style: TextStyle(
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ))
                            ],
                          ),
                        )
                      : Container(
                          height: 52,
                          color: AppTheme.colors.darkBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 48),
                              SvgPicture.asset('assets/small_circle.svg',
                                  color: Color(
                                      snapshot.data![index - 1].projectColor)),
                              SizedBox(width: 9),
                              Text(snapshot.data![index - 1].projectTitle,
                                  style: TextStyle(
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ))
                            ],
                          ),
                        ),
                ));
      },
    );
  }
}
