import 'package:flutter/material.dart';
import 'package:newsapp/config/theme/theme_const.dart';
import 'package:newsapp/core/components/news_card_action.dart';
import 'package:newsapp/core/widgets/widgets_library.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

class TopNewsCard extends StatelessWidget {
  const TopNewsCard({super.key, required this.newsEntity});

  final NewsArticleEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CachedNetworkImageClipRect(
            margin: const EdgeInsets.only(top: 16),
            height: 180,
            width: screenSize.width - 40,
            borderRadius: 8,
            imageUrl: newsEntity.urlToImage ??
                "https://placehold.co/${screenSize.width - 40}x180/png",
          ),
          Container(
              margin: const EdgeInsets.only(top: 16),
              height: 68,
              width: screenSize.width - 40,
              color: LightTheme.kPeoBlackColor.withOpacity(0.7),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            newsEntity.title!.length > 64
                                ? "${newsEntity.title!.substring(0, 64)}..."
                                : newsEntity.title!,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ],
                    ),
                    NewsCardAction(
                      time: newsEntity.postDuration ?? "",
                      category: newsEntity.source?["name"] ?? "",
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
