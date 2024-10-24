import 'dart:developer' as console;
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/text_input.dart';

import 'package:mariner/models/role_model.dart';
import 'package:mariner/pages/modules/sailor_permissions/permission_types_page.dart';

class RoleAddPopup extends StatefulWidget {
  const RoleAddPopup({super.key, required this.onSuccess});

  final Function(RoleModel) onSuccess;

  @override
  State<RoleAddPopup> createState() => _RoleAddPopupState();
}

class _RoleAddPopupState extends State<RoleAddPopup> {
  final TextEditingController _name = TextEditingController();

  String? _nameError;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Dodaj rolę',
      actionsBuilder: (context) => [
        TextButton(
          onPressed: () {
            PopupAlert.close(context);
          },
          child: const Text('Anuluj'),
        ),
        ElevatedButton(
          onPressed: () {
            bool validated = true;

            if (_name.text.trim() == '') {
              setState(() {
                _nameError = 'To pole nie może być puste';
              });

              validated = false;
            }

            if (validated) {
              PopupAlert.close(context);
              
              final role = RoleModel(
                name: _name.text,
                color: HSLColor.fromAHSL(1.0, Random().nextDouble() * 360.0, 1.0, 0.5).toColor()
              );
              
              widget.onSuccess(role);
            }
          },
          child: const Text('Zapisz'),
        ),
      ],
      children: <Widget>[
        TextInput(
          controller: _name,
          label: 'Nazwa roli',
          error: _nameError,
        )
      ],
    );
  }
}
