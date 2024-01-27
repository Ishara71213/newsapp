// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/components/app_bar_with_back_btn.dart';
import 'package:newsapp/core/components/news_card.dart';
import 'package:newsapp/features/News/presentation/saved_news/bloc/cubit/saved_news_cubit.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  ScrollController scrollController = ScrollController();
  late SavedNewsCubit savedNewsCubit;
  @override
  void initState() {
    super.initState();
    savedNewsCubit = BlocProvider.of<SavedNewsCubit>(context);
    savedNewsCubit.lodaSavedNewsList();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackBtn(
        title: "Saved News",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SavedNewsCubit, SavedNewsState>(
              builder: (context, state) {
                if (state is SavedNewsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SavedNewsLodaingSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: savedNewsCubit.savedNewsList.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                          newsEntity: savedNewsCubit.savedNewsList[index]);
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Saved News",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
