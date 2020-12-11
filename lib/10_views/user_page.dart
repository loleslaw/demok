import 'package:demok/00_models/globals.dart';
import 'package:demok/00_models/menu_option_model.dart';
import 'package:demok/10_views/components/components.dart';
import 'package:demok/20_controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:demok/00_models/configuration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'components/dropdown_picker.dart';
import 'components/segmented_selector.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _naglowek(),
          _sexListTile(),
          _educationListTile(),
          _ageSlider(),
          _polPrefSlider(),
          SizedBox(height: 16,),
          _saveButton()
        ],
      ),
    );
  }

  TextStyle tekstStyle() {
    return TextStyle(color: AppColor.textDark, fontSize: 18);
  }
  Widget _naglowek() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(style: TextStyle(color: AppColor.textDark), children: [
          TextSpan(
            text: 'Powiedz nam coś o sobie.\n',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text:
                  'Poniższe informacje będą wykorzystane jedynie do analizy Twoich odpowiedzi.')
        ]),
      ),
    );
  }

  Widget _educationListTile() {
    return GetBuilder<UserController>(
      builder: (controller) {
        return ListTile(
          title: Text(
            'Mam wykształcenie',
            style: tekstStyle(),
          ),
          trailing: DropdownPicker(
            menuOptions: Globals.educationOptioins,
            selectedOption: controller.currentEducation,
            onChanged: (value) {
              controller.setUserEducation(value);
            },
          ),
        );
      },
    );
  }

  _sexListTile() {
    final List<MenuOptionsModel> sexOptions = [
      MenuOptionsModel(
          key: "K", value: "Kobietą", icon: FontAwesomeIcons.female),
      MenuOptionsModel(
          key: "M", value: "Mężczyzną", icon: FontAwesomeIcons.male),
    ];
    return GetBuilder<UserController>(
      builder: (controller) => ListTile(
        title: Text(
          'Jestem',
          style: tekstStyle(),
        ),
        trailing: SegmentedSelector(
          selectedOption: controller.currentSex,
          menuOptions: sexOptions,
          onValueChanged: (value) {
            controller.setUserPlec(value);
          },
        ),
      ),
    );
  }

  _ageSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<UserController>(
        builder: (controller) {
          return ListTile(
            leading: Icon(FontAwesomeIcons.baby),
            trailing: Icon(FontAwesomeIcons.userSecret),
            title: Column(
              children: [
                Text('Mój wiek to około ${controller.currentAge.round()} lat', style: tekstStyle()),
                Slider(value: controller.currentAge,
                  activeColor: AppColor.selector,
                  min: 15,
                  max: 100,
                  divisions: 17,
                  onChanged: (value) {
                    controller.setUserAge(value);
                  },
                ),
              ],
            ),
          );
        }
      ),
    );
  } 

  _polPrefSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<UserController>(
        builder: (controller) {
          return ListTile(
            leading: Icon(FontAwesomeIcons.arrowCircleLeft),
            trailing: Icon(FontAwesomeIcons.arrowCircleRight),
            title: Column(
              children: [
                Text('Moje preferencje polityczne', style: tekstStyle()),
                Slider(value: controller.currentPolPref,
                  activeColor: AppColor.selector,
                  min: -10,
                  max: 10,
                  divisions: 20,
                  label: '${controller.currentPolPref}',
                  onChanged: (value) {
                    controller.setUserPolPref(value);
                  },
                ),
              ],
            ),

          );
        }
      ),
    );

  }

_saveButton() {
  return GetBuilder<UserController>(
    builder: (controller) {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RaisedButton(
        color: AppColor.selector,
        onPressed: () {
          controller.saveUserData();
        },
        padding: EdgeInsets.all(16),
        child: Text('ZAPISZ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,),
        ),
    ),
      );;
    },
  );
}

}

