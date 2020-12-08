import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowLisst = 
    [BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0,10))];

List<Map> drawerIitems = [
  {
  'icon' : FontAwesomeIcons.snowplow,
  'title' : 'Adoption'
  },
  {
  'icon' : FontAwesomeIcons.moneyCheck,
  'title' : 'Donation'
  },
  {
  'icon' : FontAwesomeIcons.plus,
  'title' : 'Add pet'
  },
  {
  'icon' : Icons.favorite_outline,
  'title' : 'Favourites'
  },
  {
  'icon' : Icons.mail,
  'title' : 'Messages'
  },
  {
  'icon' : FontAwesomeIcons.userCog,
  'title' : 'Profile'
  }
];