import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllData {
  String imageUrl;
  String name;
  IconData icon;
  String price;
  Color bgcolor;

  AllData({
    this.imageUrl,
    this.name,
    this.icon,
    this.price,
    this.bgcolor,
  });
}

final List<AllData> datalist = [
  AllData(
    imageUrl: 'assets/images/apple.png',
    name: 'Apple',
    icon: FontAwesomeIcons.apple,
    price: '\$ 100',
    bgcolor: Colors.black,
  ),
  AllData(
    imageUrl: 'assets/images/playstore.png',
    name: 'PlayStore',
    icon: FontAwesomeIcons.googlePlay,
    price: '\$ 100',
    bgcolor: Colors.lightBlue,
  ),
  AllData(
      imageUrl: 'assets/images/amazon.png',
      name: 'Amazon',
      icon: FontAwesomeIcons.amazon,
      price: '\$ 100',
      bgcolor: Color(0xFFFF9900)),
  AllData(
    imageUrl: 'assets/images/netflix.png',
    name: 'Netflix',
    icon: FontAwesomeIcons.video,
    price: '\$ 100',
    bgcolor: Colors.red,
  ),
];
