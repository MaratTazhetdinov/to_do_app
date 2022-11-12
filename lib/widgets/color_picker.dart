import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../project_add_page/project_add_page_manager.dart';
import '../theme/app_theme.dart';

// ignore: must_be_immutable
class ColorListView extends StatefulWidget {
  double width;
  WidgetRef ref;

  ColorListView({required this.width, required this.ref});

  @override
  _ColorListViewState createState() =>
      _ColorListViewState(width: width, ref: ref);
}

class _ColorListViewState extends State<ColorListView> {
  int? selectedColor;
  double width;
  WidgetRef ref;

  _ColorListViewState({required this.width, required this.ref});

  final colorsList = [
    Color(0xFFFFD60A),
    Color(0xFF32D74B),
    Color(0xFFFF453A),
    Color(0xFFFF9F0A),
    Color(0xFFBF5AF2),
    Color(0xFF64D2FF),
    Color(0xFF5E5CE6),
    Color(0xFF0A84FF),
    Color(0xFFFF2D55)
  ];

  @override
  Widget build(BuildContext context) {
    final space = (width - 280) / 8;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Container(
          height: 24,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: colorsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.zero
                      : EdgeInsets.only(left: space),
                  child: Container(
                    height: 24,
                    width: 24,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: selectedColor == index
                          ? SvgPicture.asset(
                              'assets/selected_circle.svg',
                              color: colorsList[index],
                            )
                          : SvgPicture.asset('assets/circle.svg',
                              color: colorsList[index]),
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                          ref
                              .read(projectAddPageManagerProvider.notifier)
                              .color = colorsList[index];
                          ref
                              .read(projectAddPageManagerProvider.notifier)
                              .colorChanged();
                        });
                      },
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
