import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/search_page/search_page_manager.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class SearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomTextField(
              onChanged: ref
                  .read(searchPageManagerProvider.notifier)
                  .searchFieldChanged,
              label: 'SEARCH'),
          SizedBox(height: 16),
        ],
      )),
    );
  }
}
