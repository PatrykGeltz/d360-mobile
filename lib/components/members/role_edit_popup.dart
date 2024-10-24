import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/text_input.dart';

import 'package:mariner/models/role_model.dart';

class RoleEditPopup extends StatefulWidget {
  const RoleEditPopup({super.key, required this.role, this.onSuccess});

  final RoleModel role;
  final Function(RoleModel)? onSuccess;

  @override
  State<RoleEditPopup> createState() => _RoleEditPopupState();
}

class _RoleEditPopupState extends State<RoleEditPopup> {
  final TextEditingController _name = TextEditingController();

  String? _nameError;

  @override
  void initState() {
    super.initState();

    final role = widget.role;

    _name.text = role.name;
  }

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Edytuj rolę',
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
              
              final role = widget.role.copyWith(
                name: _name.text
              );
              
              if (widget.onSuccess != null) widget.onSuccess!(role);
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
