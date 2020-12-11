
import 'package:demok/00_models/configuration.dart';
import 'package:demok/10_views/ankieta_page.dart';
import 'package:demok/10_views/polityk_page.dart';
import 'package:demok/10_views/user_page.dart';
import 'package:demok/20_controllers/pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  }

class _HomeScreenState extends State<HomeScreen> {
  PagesController pagesController = PagesController.to;

  
 @override
 Widget build(BuildContext context) {
  return Obx(()=>AnimatedContainer(
    decoration: BoxDecoration(
      color: AppColor.backgroundLight,
      borderRadius: BorderRadius.circular(pagesController.isDrawerOpen.value?30:0.0)
    ),
    transform: Matrix4.translationValues(
      pagesController.xOffset.value, 
      pagesController.yOffset.value, 
      0
    )
    ..scale(pagesController.scaleFactor.value)
    ..rotateY(pagesController.isDrawerOpen.value ? -0.5:0),

    duration: Duration(milliseconds: 250),
    child: Column(children: [
      _menu(),
      _content()
    ],)
  ),
  );
  }
Widget _content() {
  Widget toReturn = _menu();
  switch (pagesController.page.value) {
    case 'ankietaPage':
      toReturn = AnkietaScreen();  
      break;
    case 'politykPage':
      toReturn = PolitykScreen();  
      break;
    case 'userPage':
      toReturn = UserScreen();  
      break;
    default:
      toReturn = _searchBar();
  }
  return toReturn;

}

Widget _menu() {
  return Container(
    color: AppColor.tabBar,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB (8.0,16,8,0),
          child: Row(
            children: [
              SizedBox(height: 80,),
              IconButton(
                icon: Icon(
                  pagesController.isDrawerOpen.value 
                    ? Icons.arrow_back_ios 
                    : Icons.menu , size: 40,
                  color: AppColor.textLight,), 
                onPressed: () {
                  setState(() {
                    pagesController.xOffset.value = pagesController.isDrawerOpen.value ? 0 : 250;
                    pagesController.yOffset.value = pagesController.isDrawerOpen.value ? 0 :120;
                    pagesController.scaleFactor.value = pagesController.isDrawerOpen.value ? 1 : 0.7;
                    pagesController.isDrawerOpen.toggle();
                  });
              }),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('demok.pl', style: 
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textLight),),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8,16,8),
                child: Icon(FontAwesomeIcons.americanSignLanguageInterpreting, 
                  color: AppColor.textLight,
                  size: 35,
                  ),
              ),
              
            ],),
        ),
      ],
    ),
  );
}

_searchBar() {
  return  Container(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.search),
        Text('Szukaj politykka'),
        Icon(Icons.settings)

      ],
    ),
  );
}
}