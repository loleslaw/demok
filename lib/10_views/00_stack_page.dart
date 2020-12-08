
import 'package:flutter/material.dart';

import 'drawer_page.dart';
import 'home_page.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),

          
        ],
      ),
    );
  }
}