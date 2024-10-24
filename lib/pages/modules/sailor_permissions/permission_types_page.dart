import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/sailor_permissions/sailor_permission_type.dart';

@RoutePage()
class SailorPermissionsPermissionTypesPage extends StatefulWidget {
  const SailorPermissionsPermissionTypesPage({super.key});

  @override
  State<SailorPermissionsPermissionTypesPage> createState() => _SailorPermissionsPermissionTypesPageState();
}

class _SailorPermissionsPermissionTypesPageState extends State<SailorPermissionsPermissionTypesPage> {
  List<SailorPermissionType> permissionsTypes = [
    const SailorPermissionType(name: 'Coscos',),
    const SailorPermissionType(name: 'Wiritirirt'),
    const SailorPermissionType(name: 'Wiritirirt', color: Colors.redAccent,)
  ];

  @override
  Widget build(BuildContext context) {

    final colors = ThemeColors.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 16.0),
        child: Column(
          children: [
            // Header

            // const Row(
            //   children: [
            //     Expanded(child: HeaderTitle(title: 'Rodzaj')),
            //     // HeaderTitle(title: 'Opcje'),
            //     // SizedBox(width: 16.0,)
            //   ],
            // ),
            Expanded(child: ListView.builder(
                itemCount: permissionsTypes.length,
                itemBuilder: (context, index){
                  return permissionsTypes[index];
                }
            ))
          ],
        ),
      ),
      floatingActionButton: FAB( onPressed: (){
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0),  ),
              color: colors['secondary'],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderTitle(title: 'Dodaj nowy rodzaj'),
                TextField(onChanged: (value){
                  Provider.of<UserProvider>(context, listen: false).editedValue = value;
                },),
                ElevatedButton(onPressed: (){
                  setState(() {
                    permissionsTypes.add(SailorPermissionType(name: Provider.of<UserProvider>(context, listen: false).editedValue));
                  });
                  Provider.of<UserProvider>(context, listen: false).editedValue = '';
                  Navigator.pop(context);
                }, child: const Text('Dodaj'))
              ],
            ),

          );
        } );
      } )
    );
  }
}


