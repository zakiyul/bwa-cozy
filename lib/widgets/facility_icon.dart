import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class FacilityIcon extends StatelessWidget {
  final String name;
  final String imgUrl;
  final int total;
  const FacilityIcon(
      {super.key,
      required this.name,
      required this.imgUrl,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imgUrl,
          width: 32,
        ),
        Text(
          '$total $name',
          style: greyTextStyle.copyWith(fontSize: 14),
        )
      ],
    );
  }
}
