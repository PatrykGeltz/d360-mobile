import 'dart:developer' as console;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/sailor_permissions/sailor_permission.dart';

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





