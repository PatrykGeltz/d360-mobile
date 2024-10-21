import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

@RoutePage()
class SailorPermissionsPermissionsPage extends StatelessWidget {
  static const String id = '/sailor_permissions/sailor_permissions';

  const SailorPermissionsPermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(child: Text('Nazwa')),
                Expanded(child: Text('Typ')),
                Text('Opcje'),
                SizedBox(width: 24.0)
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text('Placeholder thing')),
                const SizedBox(width: 8.0),
                const Expanded(child: Text(' random type', style: TextStyle(color: Colors.white70))),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
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
