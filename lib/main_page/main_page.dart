import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/main_page/main_page_manager.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/todo_page/to_do_state.dart';
import 'package:to_do_app/widgets/custom_drawer.dart';
import 'package:to_do_app/widgets/main_list_view.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../todo_page/to_do_page_manager.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  

    ref.listen<int>(mainPageManagerProvider, ((previous, next) {
      if (next == 0) {
        showTopSnackBar(
            context, CustomSnackBar.info(message: 'Task was added'));
        print(next);
      }
    }));

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.search, color: Colors.black))
          ],
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              AutoRouter.of(context).pushNamed('/todo-page');
            },
            backgroundColor: AppTheme.colors.yellow,
            child: const Icon(Icons.add, color: Colors.black)),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 32, top: 30, bottom: 30),
                child: Text(
                  'Hello Marat! 👋',
                  style: TextStyle(
                      color: AppTheme.colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
            ),
            
            SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ));
  }
}
