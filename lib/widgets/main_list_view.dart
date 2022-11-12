import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/states/repository_state.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/extension/date_extension.dart';
import '../repository/repository_manager.dart';
import '../repository/to_do_repository.dart';

// ignore: must_be_immutable
class MainListView extends ConsumerWidget {
  Future<List<Todo>> todosList;
  WidgetRef ref;

  MainListView({required this.todosList, required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Todo>>(
      future: ref.watch(repositoryManagerProvider) is ChangedRepositoryState
          ? TodoRepository.instance.getTodos
          : todosList,
      builder: (context, snapshot) {
        return SliverToBoxAdapter(
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
              itemCount: 3,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return ListTile(
                        onTap: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(6))),
                        tileColor: AppTheme.colors.darkBlue,
                        leading: SvgPicture.asset('assets/inbox_icon.svg'),
                        title: Text('Inbox'),
                        trailing: Text(snapshot.data == null
                            ? 'Null'
                            : getAllTodos(snapshot.data!).toString()),
                        textColor: AppTheme.colors.white);
                  case 1:
                    return ListTile(
                        onTap: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        tileColor: AppTheme.colors.darkBlue,
                        leading: SvgPicture.asset('assets/today_icon.svg'),
                        title: Text('Today'),
                        trailing: Text(snapshot.data == null
                            ? 'Null'
                            : getTodayTodos(snapshot.data!).toString()),
                        textColor: AppTheme.colors.white);
                  case 2:
                    return ListTile(
                        onTap: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(6))),
                        tileColor: AppTheme.colors.darkBlue,
                        leading: SvgPicture.asset('assets/upcoming_icon.svg'),
                        title: Text('Upcoming'),
                        trailing: Text(snapshot.data == null
                            ? 'Null'
                            : getUpcomingTodos(snapshot.data!).toString()),
                        textColor: AppTheme.colors.white);
                  default:
                    return Container();
                }
              }),
        );
      },
    );
  }

  int getAllTodos(List<Todo> todosList) {
    int count = 0;
    for (var todo in todosList) {
      if (todo.todoCompletion == 0) {
        count += 1;
      }
    }
    return count;
  }

  int getTodayTodos(List<Todo> todosList) {
    int count = 0;
    for (var todo in todosList) {
      if (todo.todoCompletion == 0 &&
          todo.todoDate != null &&
          todo.todoDate!.isToday()) {
        count += 1;
      }
    }
    return count;
  }

  int getUpcomingTodos(List<Todo> todosList) {
    int count = 0;
    for (var todo in todosList) {
      if (todo.todoCompletion == 0 &&
          todo.todoDate != null &&
          todo.todoDate!.isUpcoming()) {
        count += 1;
      }
    }
    return count;
  }
}
