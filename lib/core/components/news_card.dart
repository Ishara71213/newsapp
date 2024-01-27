import 'package:flutter/material.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/core/components/news_card_action.dart';
import 'package:newsapp/core/utils/navigation_handler.dart';
import 'package:newsapp/core/widgets/widgets_library.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.newsEntity,
  });

  final NewsArticleEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 6,
        bottom: 10,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => NavigationHandler.navigateWithArgumnets(context,
                RouteConst.singleNewsScreen, {"newsEntity": newsEntity}),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    newsEntity.title ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                CachedNetworkImageClipRect(
                  margin: const EdgeInsets.only(left: 12),
                  height: 80,
                  width: 80,
                  borderRadius: 8,
                  imageUrl:
                      newsEntity.urlToImage ?? "https://placehold.co/80/png",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          NewsCardAction(newsEntity: newsEntity),
          Divider(
            color: Theme.of(context).dividerColor,
          )
        ],
      ),
    );
  }
}
