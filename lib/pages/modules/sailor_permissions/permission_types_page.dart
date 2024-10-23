import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/module/popup_alert.dart';

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
            const Row(
              children: [
                Expanded(child: HeaderTitle(title: 'Rodzaj')),
                // HeaderTitle(title: 'Opcje'),
                // SizedBox(width: 16.0,)
              ],
            ),
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

class SailorPermissionType extends StatelessWidget {
  const SailorPermissionType({super.key, required this.name, this.color});

  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name, style: TextStyle(color: color),)),
        // IconButton(onPressed: () {
        //   if(!Provider.of<UserProvider>(context).isAdmin) return;
        //
        // }, icon: const Icon(Icons.edit), ),
        // IconButton(onPressed: () {
        //   if(!Provider.of<UserProvider>(context).isAdmin) return;
        // }, icon: const Icon(Icons.delete)),
        IconButton(onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return PopupAlert(
              title: 'Szczegóły',
              confirmText: Provider.of<UserProvider>(context).isAdmin ? 'Edytuj' : null,
              cancelText: Provider.of<UserProvider>(context).isAdmin ? 'Usuń' : null,

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

