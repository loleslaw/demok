import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
    child: Center(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('SettingsPage',
           style: TextStyle(fontSize: 20),),
           SizedBox(height: 20,),
           CircularProgressIndicator(),
         ],
       ),
      ),
   ));
  }
}