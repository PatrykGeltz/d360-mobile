import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

// Components
import 'package:mariner/components/settings/option.dart';
import 'package:mariner/components/module/danger_button.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool joinRequests = true;

  final List<String> maxMembersOptions = ['10', '25', '50', '100', 'Własne'];
  String? maxMembers;

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);
    final colors = ThemeColors.of(context);

    // Options
    final List<Option> options = [
      const Option(
        icon: Icons.drive_file_rename_outline,
        title: 'Nazwa klubu',
        children: [
          Expanded(child: TextField(
            decoration: InputDecoration(
              hintText: 'Nowa nazwa klubu',
            ),
          ))

        ],
      ),
      const Option(
        icon: Icons.wrap_text,
        title: 'Opis',
        children: [
          Expanded(child: TextField(
            decoration: InputDecoration(
              hintText: 'Nowy opis',
            ),
          ))

        ],
      ),
      Option(
        icon: Icons.person,
        title: 'Maks. członków',
        children: [
          Expanded(child: DropdownMenu(
            width: double.maxFinite,
            initialSelection: maxMembersOptions[0],
            dropdownMenuEntries: maxMembersOptions.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
            onSelected: (selected){
              setState(() {
                maxMembers = selected!;
              });
            },
          )),
          Builder(builder: (context){
            if(maxMembers?.toLowerCase() != 'własne') return const SizedBox();
            return Container(
              padding: const EdgeInsets.only(left: 16.0),
              width: 48,
              child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){},
                  maxLength: 3,
              ),
            );
          })
        ],
      ),
      Option(icon: Icons.mail, title: 'Prośby o dołączenie', children: [
        Checkbox(value: joinRequests, onChanged: (newVal){
          setState(() {
            joinRequests = newVal ?? false;
          });
        })
      ])
    ];

    // Main site
    return Scaffold(
      appBar: AppBar(
        title: Text(routeData.title(context))
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ListView(
              children: [
                ...options,
                Divider(color: colors['special'],),
                const DangerButton(title: 'Zmień administratora grupy', outlined: false,),
                const DangerButton(title: 'Usuń grupę', outlined: false,),
              ],
            )),
            ElevatedButton(onPressed: (){}, child: const Text('Zapisz i wyjdź')),
            OutlinedButton(onPressed: (){}, child: const Text('wyjdź'))
          ],
        ),
      ),
    );
  }
}


