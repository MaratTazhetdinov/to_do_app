import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';

class ProjectListView extends StatelessWidget {
  final List<Color> projectColors;
  final List<String> projectsName;
  final List<int> projectListCounters;

  ProjectListView(
      {required this.projectColors,
      required this.projectsName,
      required this.projectListCounters});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
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
          itemCount: projectColors.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: AppTheme.colors.darkBlue,
              leading: Icon(Icons.circle, color: projectColors[index]),
              title: Text(projectsName[index]),
              trailing: Text(projectListCounters[index].toString()),
              textColor: AppTheme.colors.white,
            );
          },
        ),
      ),
    );
  }
}
