import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';

class CityCard extends StatelessWidget {
  final City city;
  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                city.imgUrl,
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
              city.isPopular
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        padding: EdgeInsets.all(3.63),
                        // color: purpleColor,
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18))),
                        child: Center(
                          child: Image.asset(
                            'assets/icon_star.png',
                          ),
                        ),
                      ),
                    )
                  : Container()
            ]),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
