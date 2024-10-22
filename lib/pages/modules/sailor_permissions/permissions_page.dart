import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SailorPermissionsPermissionsPage extends StatelessWidget {
  static const String id = '/sailor_permissions/sailor_permissions';

  const SailorPermissionsPermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {


    final List<SailorPermission> SailorPermissions = [
      const SailorPermission(name: 'Jakaś Nazwa', type: ' Jakiś Typ' ),
      const SailorPermission(name: 'Trochę dłuższa nazwa', type: 'kolorowy typ', color: Colors.blue,),
      const SailorPermission(name: 'WWWWWWWWWWWWWFASFASF', type: 'CośtamCośtamTamTam',),


    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: HeaderTitle(title: 'Nazwa')
                ),
                const Expanded(
                    child: HeaderTitle(title: 'Typ')
                ),
                Builder(builder: (context){
                  if(Provider.of<UserProvider>(context).isAdmin){
                    return const Row(
                      children: [
                        SizedBox(width: 8.0,),
                        HeaderTitle(title: 'Opcje'),
                        SizedBox(width: 24.0)
                      ],
                    );
                  }
                  return SizedBox();
                  }
                )

              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: SailorPermissions.length,
                  itemBuilder: (context, index){
                    return SailorPermission(
                      name: SailorPermissions[index].name,
                      type: SailorPermissions[index].type,
                      color: SailorPermissions[index].color,
                    );
                  },
              ),
            )

          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add perm');
        },
        child: const Icon(Icons.add)
      ),
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
        Expanded(child: Text(name, textAlign: TextAlign.center,)),
        const SizedBox(width: 16.0),
        Expanded(child: Text(type, textAlign: TextAlign.center,style: TextStyle(color: color,))),

        Builder(builder: (context){
          if(!Provider.of<UserProvider>(context).isAdmin) return const SizedBox(height: 48.0,);
          return Row(
            children: [
              IconButton(onPressed: () {
                if(!Provider.of<UserProvider>(context).isAdmin) return;

              }, icon: const Icon(Icons.edit), ),
              IconButton(onPressed: () {
                if(!Provider.of<UserProvider>(context).isAdmin) return;
              }, icon: const Icon(Icons.delete)),
            ],
            );
        } )
      ],
    );
  }
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign: TextAlign.center,
    style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20
    ));
  }
}

