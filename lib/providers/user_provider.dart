import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String _name = 'Witek';
  String _surname = 'Kowalski';
  String _pesel = '00000000001';
  String _role = 'Warta';

  String get name => _name;
  String get surname => _surname;
  String get pesel => _pesel;
  String get role => _role;

  String editedValue = '';

  void changeEditedValue(String? value){
    editedValue = value.toString();
    print(editedValue);
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