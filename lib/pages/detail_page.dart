import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_icon.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://goo.gl/maps/YJQCeWD1HQdwCy2Q9');
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

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset('assets/thumbnail.png'),
          ListView(
            children: [
              SizedBox(
                height: 328,
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
                                'Kuretakeso Hott',
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '\$52 / month',
                                style: greyTextStyle.copyWith(fontSize: 16),
                              )
                              // RichText(
                              //   text: TextSpan(
                              //     style: DefaultTextStyle.of(context).style,
                              //     children: <TextSpan>[
                              //       TextSpan(
                              //           text: '\$52',
                              //           style: purpleTextStyle.copyWith(
                              //               fontSize: 16)),
                              //       TextSpan(
                              //           text: ' / month',
                              //           style: greyTextStyle.copyWith(
                              //               fontSize: 16)),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                          //rating
                          Row(
                            children: [
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                            ],
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
                              total: 2),
                          // SizedBox(
                          //   width: 35,
                          // ),
                          FacilityIcon(
                              name: 'bedroom',
                              imgUrl: 'assets/icon_bedroom.png',
                              total: 3),
                          // SizedBox(
                          //   width: 35,
                          // ),
                          FacilityIcon(
                              name: 'Big Lemari',
                              imgUrl: 'assets/icon_cupboard.png',
                              total: 3),
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
                          children: [
                            Image.asset(
                              'assets/photo1.png',
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/photo2.png',
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/photo3.png',
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ],
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
                            'Jln. Kappan Sukses No. 20\nPalembang',
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
                            _makePhoneCall('0877755540781');
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
