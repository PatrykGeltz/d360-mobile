import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:provider/provider.dart';
import 'package:mariner/providers/user_provider.dart';

class Permission extends StatelessWidget {
  const Permission({
    super.key,
    required this.name,
    required this.type,
    required this.id,
    required this.deletePermission,
    this.color,
    this.isAdmin = true,
  });

  final String name;
  final String type;
  final Color? color;
  final bool isAdmin;
  final int id;
  final deletePermission;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            type,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: color,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return PopupAlert(
                title: 'Szczegóły',
                actionsBuilder: (context) {
                  return [
                    if (Provider.of<UserProvider>(context).isAdmin) ...[
                      ElevatedButton(
                        onPressed: () {
                          deletePermission();
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
                  Text('Nazwa: $name'),
                  Text('Typ: $type'),
                ],
              );
            });
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}