import 'package:flutter/material.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier{
  String _name = 'Witek';
  String _surname = 'Kowalski';
  String _pesel = '00000000001';
  String _role = 'Warta';
  XFile? _img;

  String get name => _name;
  String get surname => _surname;
  String get pesel => _pesel;
  String get role => _role;
  XFile get imagePath => _img ?? XFile('assets/images/logo.png');

  String editedValue = '';

  void changeEditedValue(String? value){
    editedValue = value.toString();
  }

  void setImagePath(XFile? value){
    _img = value;
    notifyListeners();
  }

  void setField(field){
    if(editedValue == '') return;

    switch(field){
      case 'imię':
        _name = editedValue;
        break;
      case 'nazwisko':
        _surname = editedValue;
        break;
      case 'pesel':
        _pesel = editedValue;
        break;
      case 'rola':
        _role = editedValue;
        break;
    }

    editedValue = '';

    notifyListeners();

  }

}