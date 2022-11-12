import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/repository/repository_manager.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/to_do_add_page/date_state_manager.dart';
import 'package:to_do_app/to_do_add_page/project_state_manager.dart';
import 'package:to_do_app/to_do_add_page/to_do_add_page_manager.dart';
import 'package:to_do_app/widgets/app_bar_label.dart';
import 'package:to_do_app/widgets/to_do_date_button.dart';
import 'package:to_do_app/widgets/to_do_project_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../states/add_state.dart';
import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class TodoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(todoAddPageManagerProvider);

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TodoTextField(
                        onChanged: ref
                            .read(todoAddPageManagerProvider.notifier)
                            .taskFieldChanged),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        TodoDateButton(),
                        SizedBox(width: 16),
                        TodoProjectButton()
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      text: 'ADD TODO',
                      onPressed: pageState is EnabledAddButtonState
                          ? () {
                              ref
                                  .read(repositoryManagerProvider.notifier)
                                  .changedRepository();
                              ref
                                  .read(todoAddPageManagerProvider.notifier)
                                  .addButtonPressed(
                                      ref
                                          .watch(
                                              dateStateManagerProvider.notifier)
                                          .date,
                                      ref
                                          .watch(projectStateManagerProvider
                                              .notifier)
                                          .projectID);
                              Navigator.of(context).pop();
                            }
                          : null),
                  SizedBox(height: 24)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TodoTextField extends StatelessWidget {
  ValueChanged<String>? onChanged;

  TodoTextField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        child: Form(
          child: TextFormField(
            cursorColor: AppTheme.colors.white,
            onChanged: onChanged,
            maxLines: 12,
            decoration: InputDecoration(
              hintText: 'Add text',
              hintStyle: TextStyle(
                color: AppTheme.colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
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
