import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/todo_page/to_do_page_manager.dart';
import 'package:to_do_app/todo_page/to_do_state.dart';
import 'package:to_do_app/widgets/app_bar_label.dart';
import 'package:to_do_app/widgets/projects_bottom_sheet.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../models/project_model.dart';
import '../models/to_do_model.dart';

// ignore: must_be_immutable
class TodoPage extends ConsumerWidget {
  String task = '';
  DateTime? date;
  Project? projectType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ToDoState>(toDoManagerProvider, ((previous, next) {
      if (next is ErrorToDoState) {
        showTopSnackBar(context,
            CustomSnackBar.info(message: 'You have to add text to your task'));
      } else {
        AutoRouter.of(context).pop();
        // AutoRouter.of(context).pushNamed('/main-page');
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: AppBarLabel(text: 'Add new todo', color: Colors.white),
        backgroundColor: Color(0xFF1C1C1E),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _todoTextField(),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('No date')),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ProjectBottomSheet(
                                projects: ref
                                    .read(toDoManagerProvider.notifier)
                                    .projectRepository
                                    .projectList,
                                onTap: setProject);
                          });
                    },
                    child: Text('Inbox')),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(toDoManagerProvider.notifier)
                      .addNewToDo(task, date, projectType);
                  printRepo(ref
                      .read(toDoManagerProvider.notifier)
                      .toDoRepository
                      .toDoList);
                },
                child: Text('Add ToDo')),
          ],
        ),
      ),
    );
  }

  void setProject() {}

  void printRepo(List<ToDo> repo) {
    for (var i = 0; i < repo.length; i++) {
      print('Object $i : ${repo[i].task}');
    }
  }

  Widget _todoTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Container(
        child: Form(
          child: TextFormField(
            cursorColor: AppTheme.colors.white,
            onChanged: (value) {
              task = value;
            },
            maxLines: 12,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: AppTheme.colors.darkBlue,
            ),
            textAlignVertical: TextAlignVertical.top,
            style: TextStyle(
              color: AppTheme.colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
