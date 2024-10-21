import 'dart:typed_data';

import 'package:flutter/material.dart';
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
  String imageError = '';

  String editedValue = '';

  void changeEditedValue(String? value){
    editedValue = value.toString();
  }


  // 2 * 1038576 = 2mb

  void setImagePath(XFile value) async {
    Uint8List bytes = await value.readAsBytes();
    if(bytes.length > 2 * 1048576) {
      imageError = '- plik za duży';
      notifyListeners();
      return;
    }
    imageError = '';
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