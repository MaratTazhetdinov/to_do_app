import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/extension/date_extension.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/repository/project_repository.dart';
import 'package:to_do_app/repository/repository_manager.dart';
import 'package:to_do_app/search_page/search_page_manager.dart';
import 'package:to_do_app/widgets/custom_header.dart';
import '../repository/to_do_repository.dart';
import '../theme/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class SearchViewList extends StatefulWidget {
  WidgetRef ref;

  SearchViewList({required this.ref});

  @override
  _SearchViewListState createState() => _SearchViewListState(ref: ref);
}

class _SearchViewListState extends State<SearchViewList> {
  WidgetRef ref;
  var toggledTodo = <int>[];

  _SearchViewListState({required this.ref});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: TodoRepository.instance.getTodos,
        builder: ((context, snapshot) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Card(
                          child: Container(
                            height: 98,
                            child: Column(
                              children: [
                                SizedBox(height: 22),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 32),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: snapshot.data![index]
                                                          .todoCompletion !=
                                                      0 ||
                                                  toggledTodo.contains(snapshot
                                                      .data![index].todoID)
                                              ? SvgPicture.asset(
                                                  'assets/selected_circle.svg',
                                                  width: 20,
                                                  height: 20,
                                                  color: AppTheme.colors.grey)
                                              : SvgPicture.asset(
                                                  'assets/empty_circle.svg',
                                                  width: 20,
                                                  height: 20,
                                                  color: AppTheme.colors.grey),
                                          onTap: () {
                                            setState(() {
                                              if (toggledTodo.contains(snapshot
                                                  .data![index].todoID!)) {
                                                toggledTodo.remove(snapshot
                                                    .data![index].todoID!);
                                              } else {
                                                toggledTodo.add(snapshot
                                                    .data![index].todoID!);
                                              }
                                              ref
                                                  .read(todoRepositoryProvider)
                                                  .changeTodoCompletion(
                                                      snapshot.data![index]);
                                              ref
                                                  .read(
                                                      repositoryManagerProvider
                                                          .notifier)
                                                  .changedRepository();
                                            });
                                          },
                                        ),
                                        SizedBox(width: 14),
                                        Text(snapshot.data![index].todoTask,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: AppTheme.colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ))
                                      ]),
                                ),
                                SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.only(left: 58),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        snapshot.data![index].todoDate == null
                                            ? SvgPicture.asset(
                                                'assets/no_date_small_icon.svg',
                                              )
                                            : SvgPicture.asset(
                                                snapshot.data![index].todoDate!
                                                        .isToday()
                                                    ? 'assets/today_small_icon.svg'
                                                    : 'assets/upcoming_small_icon.svg',
                                                width: 12,
                                                height: 14,
                                              ),
                                        SizedBox(width: 10),
                                        snapshot.data![index].todoDate == null
                                            ? Text(
                                                'No date',
                                                style: TextStyle(
                                                  color: AppTheme.colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              )
                                            : Text(
                                                snapshot.data![index].todoDate!
                                                        .isToday()
                                                    ? 'Today'
                                                    : 'Upcoming',
                                                style: TextStyle(
                                                  color: AppTheme.colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                        SizedBox(width: 22),
                                        SvgPicture.asset(
                                            'assets/small_circle.svg',
                                            color: Color(snapshot
                                                .data![index].projectColor!),
                                            width: 8,
                                            height: 8),
                                        SizedBox(width: 8),
                                        Text(
                                          snapshot.data![index].projectTitle!,
                                          style: TextStyle(
                                            color: AppTheme.colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.length),
              ),
            ],
          );
        }));
  }
}
