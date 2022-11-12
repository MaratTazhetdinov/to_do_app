import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/extension/date_extension.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/repository/repository_manager.dart';
import 'package:to_do_app/states/repository_state.dart';
import 'package:to_do_app/widgets/custom_header.dart';
import '../repository/to_do_repository.dart';
import '../theme/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
// class ExampleList extends StatefulWidget {
//   WidgetRef ref;

//   ExampleList({required this.ref});

//   @override
//   _ExampleListState createState() => _ExampleListState(ref: ref);
// }

// class _ExampleListState extends State<ExampleList> {
//   WidgetRef ref;
//   var toggledTodo = <int>[];

//   _ExampleListState({required this.ref});

//   // TodoRepository.instance.getTodos

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Todo>>(
//         future: ref.watch(repositoryManagerProvider) is! InitialRepositoryState
//             ? TodoRepository.instance.getTodos
//             : TodoRepository.instance.getTodos,
//         builder: ((context, snapshot) {
//           return CustomScrollView(
//             slivers: [
//               snapshot.data == null || snapshot.data!.length == 0
//                   ? SliverToBoxAdapter()
//                   : SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             left: 16, top: 32, bottom: 16),
//                         child: CustomHeader(label: "TODOS"),
//                       ),
//                     ),
//               SliverToBoxAdapter(
//                 child: ListView.separated(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return Slidable(
//                         endActionPane: ActionPane(
//                           extentRatio: 0.25,
//                           motion: BehindMotion(),
//                           children: [
//                             SlidableAction(
//                               onPressed: (context) =>
//                                   _onDismissed(snapshot.data![index]),
//                               backgroundColor: AppTheme.colors.separatorColor,
//                               foregroundColor: Colors.red,
//                               icon: Icons.delete,
//                             )
//                           ],
//                         ),
//                         child: Container(
//                           height: 98,
//                           child: Column(
//                             children: [
//                               SizedBox(height: 22),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 18, right: 32),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       InkWell(
//                                         child: snapshot.data![index]
//                                                         .todoCompletion !=
//                                                     0 ||
//                                                 toggledTodo.contains(snapshot
//                                                     .data![index].todoID)
//                                             ? SvgPicture.asset(
//                                                 'assets/selected_circle.svg',
//                                                 width: 20,
//                                                 height: 20,
//                                                 color: AppTheme.colors.grey)
//                                             : SvgPicture.asset(
//                                                 'assets/empty_circle.svg',
//                                                 width: 20,
//                                                 height: 20,
//                                                 color: AppTheme.colors.grey),
//                                         onTap: () {
//                                           setState(() {
//                                             if (toggledTodo.contains(snapshot
//                                                 .data![index].todoID!)) {
//                                               toggledTodo.remove(snapshot
//                                                   .data![index].todoID!);
//                                             } else {
//                                               toggledTodo.add(snapshot
//                                                   .data![index].todoID!);
//                                             }
//                                           });

//                                           Future.delayed(
//                                                   const Duration(seconds: 2))
//                                               .whenComplete(() => setState(() {
//                                                     ref
//                                                         .read(
//                                                             todoRepositoryProvider)
//                                                         .changeTodoCompletion(
//                                                             snapshot
//                                                                 .data![index]);
//                                                     ref
//                                                         .read(
//                                                             repositoryManagerProvider
//                                                                 .notifier)
//                                                         .changedRepository();
//                                                   }));
//                                         },
//                                       ),
//                                       SizedBox(width: 14),
//                                       Text(snapshot.data![index].todoTask,
//                                           style: TextStyle(
//                                             overflow: TextOverflow.ellipsis,
//                                             color: AppTheme.colors.white,
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 16,
//                                           ))
//                                     ]),
//                               ),
//                               SizedBox(height: 16),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 58),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       snapshot.data![index].todoDate == null
//                                           ? SvgPicture.asset(
//                                               'assets/no_date_small_icon.svg',
//                                             )
//                                           : SvgPicture.asset(
//                                               snapshot.data![index].todoDate!
//                                                       .isToday()
//                                                   ? 'assets/today_small_icon.svg'
//                                                   : 'assets/upcoming_small_icon.svg',
//                                               width: 12,
//                                               height: 14,
//                                             ),
//                                       SizedBox(width: 10),
//                                       snapshot.data![index].todoDate == null
//                                           ? Text(
//                                               'No date',
//                                               style: TextStyle(
//                                                 color: AppTheme.colors.white,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 12,
//                                               ),
//                                             )
//                                           : Text(
//                                               snapshot.data![index].todoDate!
//                                                       .isToday()
//                                                   ? 'Today'
//                                                   : 'Upcoming',
//                                               style: TextStyle(
//                                                 color: AppTheme.colors.white,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                       SizedBox(width: 22),
//                                       SvgPicture.asset(
//                                           'assets/small_circle.svg',
//                                           color: Color(snapshot
//                                               .data![index].projectColor!),
//                                           width: 8,
//                                           height: 8),
//                                       SizedBox(width: 8),
//                                       Text(
//                                         snapshot.data![index].projectTitle!,
//                                         style: TextStyle(
//                                           color: AppTheme.colors.grey,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ]),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return Row(
//                         children: [
//                           Expanded(
//                               child: Container(
//                             color: Colors.transparent,
//                             height: 1,
//                           )),
//                           Expanded(
//                               flex: 4,
//                               child: Container(
//                                 height: 1,
//                                 color: AppTheme.colors.separatorColor,
//                               ))
//                         ],
//                       );
//                     },
//                     itemCount:
//                         snapshot.data == null ? 0 : snapshot.data!.length),
//               ),
//             ],
//           );
//         }));
//   }

//   void _onDismissed(Todo todo) {
//     setState(() {
//       ref.read(todoRepositoryProvider).deleteTodo(todo.todoID!);
//       ref.read(repositoryManagerProvider.notifier).changedRepository();
//     });
//   }
// }

class ExampleList extends StatefulWidget {
  WidgetRef ref;

  ExampleList({required this.ref});

  @override
  _ExampleListState createState() => _ExampleListState(ref: ref);
}

class _ExampleListState extends State<ExampleList> {
  WidgetRef ref;
  var toggledTodo = <int>[];
  var todosList = <Todo>[];

  _ExampleListState({required this.ref});

  @override
  void initState() {
    super.initState();
    fetchTodos();
    print('---------------');
    for (var todo in todosList) {
      print(
          '${todo.todoID}, ${todo.todoTask}, ${todo.todoDate}, ${todo.todoCompletion}');
    }
    print('---------------');
  }

  // TodoRepository.instance.getTodos

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: ref.watch(repositoryManagerProvider) is! InitialRepositoryState
            ? TodoRepository.instance.getTodos
            : TodoRepository.instance.getTodos,
        builder: ((context, snapshot) {
          return CustomScrollView(
            slivers: [
              snapshot.data == null || snapshot.data!.length == 0
                  ? SliverToBoxAdapter()
                  : SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 32, bottom: 16),
                        child: CustomHeader(label: "TODOS"),
                      ),
                    ),
              SliverToBoxAdapter(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Slidable(
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
                        child: Container(
                          height: 98,
                          child: Column(
                            children: [
                              SizedBox(height: 22),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, right: 32),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          for (var todo in todosList) {
                                            print(
                                                '${todo.todoID}, ${todo.todoTask}, ${todo.todoDate}, ${todo.todoCompletion}');
                                          }
                                          setState(() {
                                            if (toggledTodo.contains(snapshot
                                                .data![index].todoID!)) {
                                              toggledTodo.remove(snapshot
                                                  .data![index].todoID!);
                                            } else {
                                              toggledTodo.add(snapshot
                                                  .data![index].todoID!);
                                            }
                                          });

                                          Future.delayed(
                                                  const Duration(seconds: 2))
                                              .whenComplete(() => setState(() {
                                                    ref
                                                        .read(
                                                            todoRepositoryProvider)
                                                        .changeTodoCompletion(
                                                            snapshot
                                                                .data![index]);
                                                    ref
                                                        .read(
                                                            repositoryManagerProvider
                                                                .notifier)
                                                        .changedRepository();
                                                  }));
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.transparent,
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

  void _onDismissed(Todo todo) {
    setState(() {
      ref.read(todoRepositoryProvider).deleteTodo(todo.todoID!);
      ref.read(repositoryManagerProvider.notifier).changedRepository();
    });
  }

  void fetchTodos() async {
    this.todosList = await TodoRepository.instance.getTodos;
  }
}
