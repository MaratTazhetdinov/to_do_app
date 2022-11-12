import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/states/picker_state.dart';
import 'package:to_do_app/widgets/project_view_list_bottom_sheet.dart';
import '../theme/app_theme.dart';
import '../to_do_add_page/project_state_manager.dart';

class TodoProjectButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: AppTheme.colors.darkBlue,
            builder: (BuildContext context) {
              return ProjectListViewBottomSheet(ref: ref);
            });
      },
      child: Container(
        height: 32,
        decoration: BoxDecoration(
            color: AppTheme.colors.darkBlue,
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: ref.watch(projectStateManagerProvider) is! InitPickerState
                ? [
                    SvgPicture.asset('assets/small_circle.svg',
                        color: Color(ref
                            .read(projectStateManagerProvider.notifier)
                            .projectColor!)),
                    SizedBox(width: 8),
                    Text(
                      ref
                          .read(projectStateManagerProvider.notifier)
                          .projectTitle!,
                      style: TextStyle(
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ]
                : [
                    SvgPicture.asset('assets/inbox_small_icon.svg'),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Inbox',
                      style: TextStyle(
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ],
          ),
        ),
      ),
    );
  }
}
