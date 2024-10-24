import 'dart:developer' as console;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/members/role_add_popup.dart';

import 'package:mariner/components/members/roles_list.dart';

import 'package:mariner/models/role_model.dart';

@RoutePage()
class MembersRolesPage extends StatelessWidget {
  const MembersRolesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<RoleModel> roles = [
      RoleModel(name: 'Rola 1', color: Color(0xFFFF0000)),
      RoleModel(name: 'Rola 2', color: Color(0xFFFFFF00)),
      RoleModel(name: 'Rola 3', color: Color(0xFF00FF00)),
      RoleModel(name: 'Rola 4', color: Color(0xFF0000FF)),
      RoleModel(name: 'Rola 4', color: Color(0xFF0000FF)),
      RoleModel(name: 'Rola 4', color: Color(0xFF0000FF)),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: RolesList(
              roles: roles,
              onEdit: (index, newRole) {
                final role = roles[index];

                console.log('Edited role "${role.name}"');
              },
              onDelete: (index) {
                final role = roles[index];

                console.log('Deleted role "${role.name}"');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => RoleAddPopup(
                  onSuccess: (newRole) {
                    console.log('Created new role named "${newRole.name}" with color ${newRole.color.toString()}');
                  },
                )
              );
            },
            child: const Text('Dodaj rolę'),
          )
        ],
      ),
    );
  }
}

// Table(
//   columnWidths: const {
//     0: IntrinsicColumnWidth(),
//     1: FlexColumnWidth(),
//     2: IntrinsicColumnWidth()
//   },
//   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//   children: const <TableRow>[
//     TableRow(
//       children: [
//         TableCell(child: Text('Kolor')),
//         TableCell(child: Text('Nazwa')),
//         TableCell(child: Text('Opcje')),
//       ]
//     )
//   ],
// )
