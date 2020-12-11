import 'package:demok/00_models/configuration.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton({this.icon, this.labelText, this.onPressed});
  final String labelText;
  final IconData icon;
  final void Function() onPressed;
  //final String screen;


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0,0,26.0,0),
            child: Icon(icon, color: AppColor.textLight,),
          ),
          Text(labelText, style: TextStyle(color: AppColor.textLight, fontSize: 20), )
      ],),
      
      onPressed: onPressed,
    );
  }
}