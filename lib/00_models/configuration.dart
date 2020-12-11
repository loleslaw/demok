import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppColor {
  static final Color tabBar = Color(0xFF2C3E50);
  static final Color backgroundDark = Color(0xFF34495E);
  static final Color textLight = Colors.white;
  static final Color textDark = Color(0xFF2C3E50);
  static final Color backgroundLight = Colors.grey[200];
  static final Color selector = Colors.amber;

}



List<BoxShadow> shadowLisst = 
    [BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0,10))];

List<Map> drawerIitems = [
  {
  'icon' : FontAwesomeIcons.snowplow,
  'title' : 'Wypełnij ankietę',
  'page' : 'ankietaPage'
  },
  {
  'icon' : FontAwesomeIcons.moneyCheck,
  'title' : 'Oceń polityka',
  'page' : 'politykPage'
  },
  {
  'icon' : FontAwesomeIcons.userCog,
  'title' : 'Twój profil',
  'page' : 'userPage'
  }
];