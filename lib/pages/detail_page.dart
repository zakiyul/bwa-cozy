import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_icon.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  const DetailPage({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(space.mapUrl);
    // final Uri _url = Uri.parse('tes123');

    _launchUrl() async {
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> _makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    int idx = 0;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.network(space.imgUrl),
          ListView(
            children: [
              SizedBox(
                height: 228,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //todo: TITLE & RATING
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                space.name,
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '\$${space.price} / month',
                                style: greyTextStyle.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                          //rating
                          Row(
                            children: [1, 2, 3, 4, 5].map((idx) {
                              return Container(
                                margin: EdgeInsets.only(left: 2),
                                child: RatingItem(
                                  index: idx,
                                  rating: space.rating,
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //todo: MAIN FACILITIES
                      Text(
                        'Main Facilities',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityIcon(
                              name: 'kitchen',
                              imgUrl: 'assets/icon_kitchen.png',
                              total: space.numberOfKitchens),
                          // SizedBox(
                          //   width: 35,
                          // ),
                          FacilityIcon(
                              name: 'bedroom',
                              imgUrl: 'assets/icon_bedroom.png',
                              total: space.numberOfBedrooms),
                          // SizedBox(
                          //   width: 35,
                          // ),
                          FacilityIcon(
                              name: 'Big Lemari',
                              imgUrl: 'assets/icon_cupboard.png',
                              total: space.numberOfCupboards),
                          // SizedBox(
                          //   width: 35,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //todo: PHOTOS
                      Text(
                        'Photos',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((item) {
                            idx++;
                            return Container(
                              margin: EdgeInsets.only(left: idx == 1 ? 0 : 18),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList()
                          // Image.asset(
                          //   'assets/photo1.png',
                          //   width: 110,
                          //   fit: BoxFit.cover,
                          // ),
                          // SizedBox(
                          //   width: 18,
                          // ),
                          // Image.asset(
                          //   'assets/photo2.png',
                          //   width: 110,
                          //   fit: BoxFit.cover,
                          // ),
                          // SizedBox(
                          //   width: 18,
                          // ),
                          // Image.asset(
                          //   'assets/photo3.png',
                          //   width: 110,
                          //   fit: BoxFit.cover,
                          // ),
                          ,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //todo: LOCATION
                      Text(
                        'Location',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //text
                          Text(
                            space.address,
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                          //icon
                          InkWell(
                            onTap: () {
                              _launchUrl();
                            },
                            child: Image.asset(
                              'assets/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //todo: book button
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(purpleColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(17)))),
                          onPressed: () {
                            _makePhoneCall(space.phone);
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                  ),
                ),
                Image.asset(
                  'assets/btn_wishlist.png',
                  width: 40,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
