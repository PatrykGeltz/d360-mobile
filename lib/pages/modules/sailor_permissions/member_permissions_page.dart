import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/sailor_permissions/license.dart';

@RoutePage()
class SailorPermissionsMemberPermissionsPage extends StatelessWidget {
  const SailorPermissionsMemberPermissionsPage({super.key});

  @override

  Widget build(BuildContext context) {
    final List<License> permissions = [
      const License(name: 'Testing', licenseNumber: '08764467', obtainingDate: '02-02-2022'),
      const License(name: 'Inny testing', licenseNumber: '97548436', obtainingDate: '06-01-2522')
    ];

    final colors = ThemeColors.of(context);
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 24.0,),
        child: Column(
          children: permissions
        ),
      ),

      // FAB and adding form
      floatingActionButton: FAB(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),),
              color: colors['secondary'],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderTitle(title: 'Nowa licencja'),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Nazwa licencji'
                  ),
                  onChanged: (val) {},
                ),
                const SizedBox(height: 8.0,),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Numer licencji'
                  ),
                  onChanged: (val) {},
                ),
                const SizedBox(height: 8.0,),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Data wydania'
                  ),
                  onChanged: (val) {},
                ),
                const SizedBox(height: 8.0,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Dodaj'))
              ],
            ),

          );
        });
      }));
  }
}

