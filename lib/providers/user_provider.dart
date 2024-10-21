import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String _name = 'Jan';
  String _surname = 'Kowalski';
  String _pesel = '00000000001';
  String _role = 'woźny';

  String get name => _name;
  String get surname => _surname;
  String get pesel => _pesel;
  String get role => _role;

  String editedValue = '';

  void changeEditedValue(String? value){
    editedValue = value.toString();
  }

  void setField(field){
    if(editedValue == '') return;

    switch(field){
      case 'name':
        _name = editedValue;
        break;
      case 'surname':
        _surname = editedValue;
        break;
      case 'pesel':
        _pesel = editedValue;
        break;
      case 'role':
        _role = editedValue;
        break;
    }

    editedValue = '';

  }

}