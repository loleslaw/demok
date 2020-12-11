
import 'package:demok/00_models/configuration.dart';
import 'package:demok/10_views/components/menu_button.dart';
import 'package:demok/10_views/settings_page.dart';
import 'package:demok/20_controllers/pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final PagesController pagesController = PagesController.to;
 @override
 Widget build(BuildContext context) {
  return Container(
    color: AppColor.backgroundDark,
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
          child: CircleAvatar(backgroundColor: AppColor.backgroundLight,),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Imie i nazwisko', style: TextStyle(color: AppColor.textLight, fontSize: 18, fontWeight: FontWeight.bold),),
          Text('aktualny status', style: TextStyle(color: AppColor.textLight),),
        ],)
      ],),
    );
  }

  _menu() {
    return  Column(
      children: drawerIitems.map((element) => Row(
        children: [
          _menuButton(icon: element['icon'],
            labelText: element['title'],
            page: element['page'],
          ),
        ],)).toList()
    );
  }

  _bottomBar() {
    return Row(children: [
      MenuButton(icon: FontAwesomeIcons.cog, labelText: 'Ustawienia', onPressed: _settingsPage,)
    ],);
}
_settingsPage() {
  Get.to(SettingsPage());
}
 
  _menuButton({IconData icon, String labelText, String page}) {
    return FlatButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0,0,26.0,0),
              child: Icon(icon, color: Colors.white,),
            ),
 
            Text(labelText, style: TextStyle(color: Colors.white, fontSize: 20), ),
            
        ],),
      ),
      
      onPressed: () {
        pagesController.page.value = page;
        pagesController.xOffset.value = 0;
        pagesController.yOffset.value = 0;
        pagesController.scaleFactor.value = 1;
        pagesController.isDrawerOpen.toggle();
      },
    );
  }

}


