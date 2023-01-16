import 'package:cozy/models/space.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/widgets/navbar_item.dart';
import 'package:cozy/widgets/space_card.dart';
import 'package:cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';

import 'package:cozy/models/city.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //TODO: Popular City
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                        id: 1, name: 'Jakarta', imgUrl: 'assets/city1.png'),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                        id: 2,
                        name: 'Bandung',
                        imgUrl: 'assets/city2.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                        id: 3, name: 'Surabaya', imgUrl: 'assets/city3.png'),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //TODO: Recomended Space
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  SpaceCard(
                    space: Space(
                        id: 1,
                        name: 'Kuretakeso Hott',
                        price: 52,
                        city: 'Bandung',
                        country: 'Germany',
                        imgUrl: 'assets/space1.png',
                        rating: 4),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(
                    space: Space(
                        id: 2,
                        name: 'Roemah Nenek',
                        price: 11,
                        city: 'Seattle',
                        country: 'Bogor',
                        imgUrl: 'assets/space3.png',
                        rating: 5),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(
                    space: Space(
                        id: 1,
                        name: 'Darrling How',
                        price: 20,
                        city: 'Jakarta',
                        country: 'Indonesia',
                        imgUrl: 'assets/space2.png',
                        rating: 3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //TODO: Tips n Guide
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  TipsCard(
                      tips: Tips(
                          id: 1,
                          title: 'City Guidelines',
                          imgUrl: 'tips1.png',
                          date: '20 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                      tips: Tips(
                          id: 2,
                          title: 'Jakarta Fairship',
                          imgUrl: 'tips2.png',
                          date: '11 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          NavbarItem(
            iconUrl: 'assets/icon_home.png',
            isActive: true,
          ),
          NavbarItem(
            iconUrl: 'assets/icon_mail.png',
            isActive: false,
          ),
          NavbarItem(
            iconUrl: 'assets/icon_card.png',
            isActive: false,
          ),
          NavbarItem(
            iconUrl: 'assets/icon_love.png',
            isActive: false,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
