import 'package:flutter/material.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier{
  String _name = 'Witek';
  String _surname = 'Kowalski';
  String _pesel = '00000000001';
  String _role = 'Warta';
  String _img ="";
  String _email="";

  String get name => _name;
  String get surname => _surname;
  String get pesel => _pesel;
  String get role => _role;
  String get avatarUrl => _img;
  String get email => _email;

  String editedValue = '';

  void changeEditedValue(String? value){
    editedValue = value.toString();
  }
  void setName(String value){
    _name=value;
    notifyListeners();
  }

  void setAvatar(String value){
    _img = value;
    notifyListeners();
  }

  void setEmail(String value){
    _email = value;
    notifyListeners();
  }

  void setField(field){
    if(editedValue == '') return;

    switch(field){
      case 'imię':
        _name = editedValue;
        break;
      case 'email':
        _email = editedValue;
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