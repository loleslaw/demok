import 'package:animated_drawer/configuration.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  }

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
 @override
 Widget build(BuildContext context) {
  return AnimatedContainer(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(isDrawerOpen?30:0.0)
    ),
    transform: Matrix4.translationValues(xOffset, yOffset, 0)
    ..scale(scaleFactor)
    ..rotateY(isDrawerOpen? -0.5:0),

    duration: Duration(milliseconds: 250),
    child: Column(children: [
      _menu(),
      _searchBar(),
    ],)

  );
  }


Widget _menu() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(height: 80,),
            IconButton(
              icon: Icon(isDrawerOpen ? Icons.arrow_back_ios : Icons.menu , size: 40,), 
              onPressed: () {
                setState((){
                  xOffset = isDrawerOpen ? 0 : 250;
                  yOffset = isDrawerOpen ? 0 :120;
                  scaleFactor = isDrawerOpen ? 1 : 0.7;
                  isDrawerOpen = !isDrawerOpen;
                });
            }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Location'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: primaryGreen,),
                      Text('Ukraina', style: TextStyle(color: primaryGreen, fontSize: 20),),
                    ],
                  ),
                ],
              ),
            ),
            CircleAvatar(),
            
          ],),
      ),
    ],
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