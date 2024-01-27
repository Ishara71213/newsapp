import 'package:flutter/material.dart';
import 'package:newsapp/core/components/app_bar_with_back_btn.dart';
import 'package:newsapp/core/components/news_card_action.dart';
import 'package:newsapp/core/widgets/widgets_library.dart';
import 'package:newsapp/features/News/domain/entities/news_article_entity.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SingleNewsScreen extends StatefulWidget {
  final dynamic data;
  const SingleNewsScreen({super.key, required this.data});

  @override
  State<SingleNewsScreen> createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
  late NewsArticleEntity newsEntity;

  @override
  void initState() {
    super.initState();
    newsEntity = widget.data['newsEntity'] as NewsArticleEntity;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWithBackBtn(title: ""),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                newsEntity.title ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CachedNetworkImageClipRect(
                margin: const EdgeInsets.only(top: 16),
                height: 180,
                width: screenSize.width - 40,
                borderRadius: 8,
                imageUrl: newsEntity.urlToImage ??
                    "https://placehold.co/${screenSize.width - 40}x180/png",
              ),
              const SizedBox(height: 8),
              NewsCardAction(newsEntity: newsEntity),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "By ${newsEntity.author ?? 'Unknown Author'}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${newsEntity.source?['name']} | USA".toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    indent: 0,
                    endIndent: screenSize.width * 6 / 10,
                    thickness: 1.8,
                  ),
                  if (newsEntity.content != null)
                    Opacity(
                      opacity: 0.8,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              newsEntity.content!.split("[+").first,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                    ),
                  if (newsEntity.content == null)
                    Opacity(
                      opacity: 0.8,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              newsEntity.description ?? "",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                    ),
                  const SizedBox(height: 4),
                  Opacity(
                    opacity: 0.8,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => launchUrlString(newsEntity.url!),
                          child: Text(
                            'Read More',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).colorScheme.tertiary,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
