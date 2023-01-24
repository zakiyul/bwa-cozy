import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

import 'package:cozy/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.asset(
        //   tips.imgUrl,
        //   height: 50,
        //   width: 50,
        // ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.date}',
              style: greyTextStyle,
            )
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ))
      ],
    );
  }
}
