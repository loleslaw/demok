
import 'package:demok/00_models/configuration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
 @override
 Widget build(BuildContext context) {
  return Container(
    color: primaryGreen,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      _topBar(),
      _menu(),
      _bottomBar()
    ],
    ),
  );
  }

  _topBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Imie i nazwisko', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
          Text('aktualny status', style: TextStyle(color: Colors.white),),
        ],)
      ],),
    );
  }
  _menu() {
    return  Column(
      children: drawerIitems.map((element) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Icon(element['icon'], color: Colors.white,),
          ),
          Text(element['title'], style: TextStyle(color: Colors.white, fontSize: 20), )
        ],)).toList()
    );
  }

  _bottomBar() {
    return Row(children: [
      IconButton(
        icon: Icon(FontAwesomeIcons.cog, color: Colors.white,),
        onPressed: () {},
      ),
      Text('Settings', style: TextStyle(color: Colors.white, fontSize: 18),)

    ],);

  }
}


