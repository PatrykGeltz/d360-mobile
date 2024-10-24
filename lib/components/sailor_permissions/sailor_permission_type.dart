import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:provider/provider.dart';
import 'package:mariner/providers/user_provider.dart';

class SailorPermissionType extends StatelessWidget {
  const SailorPermissionType({super.key, required this.name, this.color});

  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name, style: TextStyle(color: color),)),
        IconButton(onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return PopupAlert(
              title: 'Szczegóły',
              actionsBuilder: (context) {
                return [
                  if (Provider.of<UserProvider>(context).isAdmin) ...[
                    ElevatedButton(
                      onPressed: () {
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
                Text('kolor: RGB(${color?.red ?? 0}, ${color?.green ?? 0}, ${color?.blue ?? 0})'),
              ],
            );
          });

        }, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
