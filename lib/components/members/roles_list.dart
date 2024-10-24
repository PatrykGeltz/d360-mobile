import 'package:flutter/material.dart';

import 'package:mariner/components/members/role_edit_popup.dart';
import 'package:mariner/components/module/popup_alert.dart';

import 'package:mariner/models/role_model.dart';

class RolesList extends StatelessWidget {
  const RolesList({super.key, required this.roles, this.onEdit, this.onDelete});

  final List<RoleModel> roles;
  final Function(int, RoleModel)? onEdit;
  final Function(int)? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: roles.length,
      itemBuilder: (context, index) {
        final role = roles[index];

        return Row(
          children: <Widget>[
            const SizedBox(height: 48.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 36.0,
                decoration: BoxDecoration(
                  color: role.color,
                  borderRadius: const BorderRadius.all(Radius.circular(18.0))
                ),
                alignment: Alignment.center,
                child: Text(
                  role.name,
                  style: TextStyle(color: role.color.computeLuminance() > 0.5 ? Colors.black : Colors.white),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RoleEditPopup(
                      role: role,
                      onSuccess: (newRole) {
                        if (onEdit != null) onEdit!(index, newRole);
                      },
                    );
                  }
                );
              },
              icon: const Icon(Icons.edit)
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => PopupAlert(
                      title: 'Potwierdzenie usunięcia',
                      actionsBuilder: (context) => [
                        TextButton(
                          onPressed: () {
                            PopupAlert.close(context);
                          },
                          child: const Text('Nie'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            PopupAlert.close(context);

                            if (onDelete != null) onDelete!(index);
                          },
                          child: const Text('Tak'),
                        ),
                      ],
                      children: <Widget>[
                        Text('Czy na pewno chcesz usunąć rolę "${role.name}"?')
                      ],
                    )
                  );
                },
                icon: const Icon(Icons.delete)
            ),
          ]
        );
      },
    );
  }
}
