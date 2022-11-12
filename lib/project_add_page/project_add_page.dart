import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/project_add_page/project_add_page_manager.dart';
import 'package:to_do_app/repository/repository_manager.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/widgets/app_bar_label.dart';
import 'package:to_do_app/widgets/color_picker.dart';
import 'package:to_do_app/widgets/custom_header.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

import '../states/add_state.dart';
import '../widgets/custom_button.dart';

class ProjectAddPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(projectAddPageManagerProvider);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            AppBarLabel(text: 'Add new project', color: AppTheme.colors.white),
        backgroundColor: AppTheme.colors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.clear, color: AppTheme.colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                              onChanged: ref
                                  .read(projectAddPageManagerProvider.notifier)
                                  .nameFieldChanged,
                              label: 'NAME'),
                          SizedBox(height: 24),
                          CustomHeader(label: 'COLOR'),
                          SizedBox(height: 8)
                        ],
                      ),
                    ),
                    ColorListView(width: width, ref: ref),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      text: 'ADD PROJECT',
                      onPressed: pageState is EnabledAddButtonState
                          ? () {
                              ref
                                  .read(repositoryManagerProvider.notifier)
                                  .changedRepository();
                              ref
                                  .read(projectAddPageManagerProvider.notifier)
                                  .addButtonPressed();
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
