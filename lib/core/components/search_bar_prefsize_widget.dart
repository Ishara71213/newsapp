import 'package:flutter/material.dart';
import 'package:newsapp/core/components/search_bar.dart';

class SearchBarPrefSizeWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const SearchBarPrefSizeWidget({super.key});

  @override
  State<SearchBarPrefSizeWidget> createState() =>
      _SearchBarPrefSizeWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _SearchBarPrefSizeWidgetState extends State<SearchBarPrefSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 0,
          bottom: 16,
        ),
        child: SearchBarWidget(),
      ),
    );
  }
}
