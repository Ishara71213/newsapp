import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsCardAction extends StatelessWidget {
  final String time;
  final String category;

  const NewsCardAction({super.key, required this.time, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              category,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/save_icon.svg',
              height: 15,
            ),
            const SizedBox(
              width: 12,
            ),
            SvgPicture.asset(
              'assets/icons/share.svg',
              height: 15,
            ),
          ],
        )
      ],
    );
  }
}
