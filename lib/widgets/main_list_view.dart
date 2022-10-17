import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/theme/app_theme.dart';

class MainListView extends StatelessWidget {
  // final List<MainListTile> mainListTile;

  // MainListView({required this.mainListTile});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        // child: ListView.separated(
        //   addRepaintBoundaries: true,
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   separatorBuilder: (context, index) {
        //     return Row(
        //       children: [
        //         Expanded(
        //             child: Container(
        //           color: AppTheme.colors.darkBlue,
        //           height: 1,
        //         )),
        //         Expanded(
        //             flex: 4,
        //             child: Container(
        //               height: 1,
        //               color: AppTheme.colors.separatorColor,
        //             ))
        //       ],
        //     );
        //   },
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       tileColor: AppTheme.colors.darkBlue,
        //       leading: SvgPicture.asset(mainListTile[index].iconPath),
        //       title: Text(mainListTile[index].label),
        //       trailing: Text(mainListTile[index].counter.toString()),
        //       textColor: AppTheme.colors.white,
        //     );
        //   },
        // ),
      ),
    );
  }
}
