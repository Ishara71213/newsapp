import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:newsapp/features/News/presentation/home_screen/bloc/cubit/home_cubit.dart';
import 'package:newsapp/features/News/presentation/saved_news/bloc/cubit/saved_news_cubit.dart';
import 'package:share_plus/share_plus.dart';

class NewsCardAction extends StatefulWidget {
  final NewsArticleEntity newsEntity;

  const NewsCardAction({super.key, required this.newsEntity});

  @override
  State<NewsCardAction> createState() => _NewsCardActionState();
}

class _NewsCardActionState extends State<NewsCardAction> {
  late SavedNewsCubit savedNewsCubit;
  late HomeCubit homeCubit;
  bool isSaved = false;
  int currentId = 0;
  @override
  void initState() {
    super.initState();
    savedNewsCubit = BlocProvider.of<SavedNewsCubit>(context);
    homeCubit = BlocProvider.of<HomeCubit>(context);
    isSaved = widget.newsEntity.isSaved ?? false;
    currentId = widget.newsEntity.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              widget.newsEntity.postDuration ?? "",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.newsEntity.source?["name"] ?? "",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Row(
              children: [
                BlocBuilder<SavedNewsCubit, SavedNewsState>(
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () async {
                          await saveUnsave();
                        },
                        child: !isSaved
                            ? SvgPicture.asset(
                                'assets/icons/save_icon.svg',
                                height: 15,
                              )
                            : SvgPicture.asset(
                                'assets/icons/save_icon_saved.svg',
                                height: 15,
                              ));
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.newsEntity.url != null) {
                      Share.share(widget.newsEntity.url!);
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/icons/share.svg',
                    height: 15,
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }

  Future<void> saveUnsave() async {
    if (!isSaved) {
      int id = await savedNewsCubit.saveNews(widget.newsEntity);
      if (id != 0) {
        if (mounted) {
          setState(() {
            isSaved = true;
            currentId = id;
          });
        }
      }
    } else {
      bool isDeleted = await savedNewsCubit.unsaveNews(currentId);
      if (isDeleted) {
        if (mounted) {
          isSaved = false;
          currentId = 0;
          setState(() {
            isSaved = false;
            currentId = 0;
          });
        }
      }
    }
    await savedNewsCubit.refreshList();
    homeCubit.refresh();
  }
}
