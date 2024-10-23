import 'dart:developer' as console;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/module/popup_alert.dart';

@RoutePage()
class SailorPermissionsPermissionsPage extends StatelessWidget {
  const SailorPermissionsPermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    final List<SailorPermission> sailorPermissions = [
      const SailorPermission(name: 'Jakaś Nazwa', type: ' Jakiś Typ' ),
      const SailorPermission(name: 'Trochę dłuższa nazwa', type: 'kolorowy typ', color: Colors.blue,),
      const SailorPermission(name: 'Testowa nazwa', type: 'Coś tam jakoś tam',),
    ];

    final List<String> types = ['typ1', 'typ2', 'random typ'];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
        child: Column(
          children: [
            // Headers
            const Row(
              children: [
                const Expanded(
                  child: HeaderTitle(title: 'Nazwa')
                ),
                const Expanded(
                    child: HeaderTitle(title: 'Typ')
                ),
                SizedBox(width: 40,)
              ],
            ),

            // List builder
            Expanded(
              child: ListView.builder(
                  itemCount: sailorPermissions.length,
                  itemBuilder: (context, index){
                    return sailorPermissions[index];
                  },
              ),
            )

          ],
        )
      ),
      floatingActionButton: FAB(onPressed: (){
        showModalBottomSheet(context: context, builder: (context){

          // TODO: Create component of bottom sheet
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: colors['background'],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0) )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderTitle(title: 'Dodaj nowy patent'),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    labelText: 'Nazwa patentu',
                    // hintText: 'żeglarz jachtowy'
                  ),
                ),
                const SizedBox(height: 8.0,),
                DropdownMenu(
                  initialSelection: types.first,
                  onSelected: (value){},
                  width: double.maxFinite,
                  dropdownMenuEntries: types.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
                const SizedBox(height: 8.0,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Dodaj')),
              ],
            ),
          );
        });
      })
    );
  }
}

class SailorPermission extends StatelessWidget {
  const SailorPermission({super.key, required this.name, required this.type, this.color, this.isAdmin = true});

  final String name;
  final String type;
  final Color? color;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),)),
        const SizedBox(width: 16.0),
        Expanded(child: Text(type,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: color,
              overflow: TextOverflow.ellipsis
            ))),

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
                Text('Nazwa: $name'),
                Text('Typ: $type'),
              ],
            );
          });

        }, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}



