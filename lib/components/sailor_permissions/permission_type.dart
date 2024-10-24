import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:provider/provider.dart';
import 'package:mariner/providers/user_provider.dart';

class PermissionType extends StatelessWidget {
  const PermissionType({super.key, required this.name, required this.id, required this.deletePermissionType, this.color});

  final String name;
  final Color? color;
  final int id;
  final deletePermissionType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name, style: TextStyle(color: color))),
        IconButton(onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return PopupAlert(
              title: 'Szczegóły',
              actionsBuilder: (context) {
                return [
                  if (Provider.of<UserProvider>(context).isAdmin) ...[
                    ElevatedButton(
                      onPressed: () {
                        deletePermissionType();
                        PopupAlert.close(context);
                      },
                      child: const Text('Usuń'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        PopupAlert.close(context);
                      },
                      child: const Text('Edytuj'),
                    ),
                  ] else ...[
                    TextButton(
                      onPressed: () {
                        PopupAlert.close(context);
                      },
                      child: const Text('Zamknij'),
                    ),
                  ],
                ];
              },
              children: [
                Text('Nazwa typu: $name'),
                Text('Kolor: RGB(${color?.red ?? 0}, ${color?.green ?? 0}, ${color?.blue ?? 0})'),
              ],
            );
          });
        }, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
