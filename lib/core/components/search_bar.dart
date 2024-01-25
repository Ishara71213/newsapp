import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      style: Theme.of(context).inputDecorationTheme.counterStyle,
      controller: _searchController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          hintText: "Search News",
          prefixIconColor:
              Theme.of(context).inputDecorationTheme.prefixIconColor,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder),
    );
  }
}
