import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/extension/date_extension.dart';
import 'package:to_do_app/states/picker_state.dart';
import 'package:to_do_app/to_do_add_page/date_state_manager.dart';
import '../theme/app_theme.dart';
import 'custom_calendar.dart';

class TodoDateButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: AppTheme.colors.darkBlue,
            context: context,
            builder: (BuildContext context) {
              return CustomCalendar(ref: ref);
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
            children: ref.watch(dateStateManagerProvider) is! InitPickerState
                ? [
                    SvgPicture.asset(ref
                            .read(dateStateManagerProvider.notifier)
                            .date!
                            .isToday()
                        ? 'assets/today_small_icon.svg'
                        : 'assets/upcoming_small_icon.svg'),
                    SizedBox(width: 8),
                    Text(
                      ref
                              .read(dateStateManagerProvider.notifier)
                              .date!
                              .isToday()
                          ? 'Today'
                          : 'Upcoming',
                      style: TextStyle(
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ]
                : [
                    SvgPicture.asset('assets/no_date_small_icon.svg',
                        color: AppTheme.colors.grey),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'No date',
                      style: TextStyle(
                        color: AppTheme.colors.grey,
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
