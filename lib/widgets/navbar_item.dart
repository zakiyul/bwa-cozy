import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  final String iconUrl;
  final bool isActive;

  const NavbarItem({super.key, required this.iconUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          iconUrl,
          height: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}
