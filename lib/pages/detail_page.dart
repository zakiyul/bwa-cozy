import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_icon.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  const DetailPage({super.key, required this.space});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(widget.space.mapUrl);
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

    void _toggleFavorite() {
      setState(() {
        if (_isFavorited) {
          _isFavorited = false;
        } else {
          _isFavorited = true;
        }
      });
    }

    int idx = 0;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.network(widget.space.imgUrl),
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
                                widget.space.name,
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '\$${widget.space.price} / month',
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
                                  rating: widget.space.rating,
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
                              total: widget.space.numberOfKitchens),
                          // SizedBox(
                          //   width: 35,
                          // ),
                          FacilityIcon(
                              name: 'bedroom',
                              imgUrl: 'assets/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms),
                          // SizedBox(
                          //   width: 35,
                          // ),
                          FacilityIcon(
                              name: 'Big Lemari',
                              imgUrl: 'assets/icon_cupboard.png',
                              total: widget.space.numberOfCupboards),
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
                          children: widget.space.photos.map((item) {
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
                          }).toList(),
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
                            widget.space.address,
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
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content:
                                    const Text('Are you sure to make a call?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        _makePhoneCall(widget.space.phone),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                            // _makePhoneCall(widget.space.phone);
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
                IconButton(
                  icon: (_isFavorited
                      ? Image.asset(
                          'assets/btn_wishlist_fav.png',
                          width: 40,
                        )
                      : Image.asset(
                          'assets/btn_wishlist.png',
                          width: 40,
                        )),
                  onPressed: _toggleFavorite,
                  // child: Image.asset(
                  //   'assets/btn_wishlist.png',
                  //   width: 40,
                  // ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
