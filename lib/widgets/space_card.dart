import 'package:cozy/pages/detail_page.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:cozy/models/space.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      space: space,
                    )));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imgUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18))),
                      child: Row(children: [
                        //icon
                        Padding(
                          padding: const EdgeInsets.all(2.97),
                          child: Image.asset('assets/icon_star.png'),
                        ),
                        //rating
                        Text(
                          '${space.rating}/5',
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          //detail text
          Container(
            child: Column(
              children: [
                Text(
                  space.name,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 2,
                ),
                RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                      TextSpan(
                          text: '\$${space.price.toString()}',
                          style: purpleTextStyle),
                      TextSpan(
                          text: ' / month',
                          style: greyTextStyle.copyWith(fontSize: 16))
                    ])),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextStyle.copyWith(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
