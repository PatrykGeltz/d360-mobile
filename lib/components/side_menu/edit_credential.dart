import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/providers/user_provider.dart';

class EditCredential extends StatelessWidget {
  const EditCredential({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0),  ),
        color: colors['secondary'],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Edycja - $item',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700
            ),
          ),

          TextField(
            textAlign: TextAlign.center,
            onChanged: (value){
              Provider.of<UserProvider>(context, listen: false).changeEditedValue(value);
            },
            decoration: InputDecoration(
              focusColor: colors['textPrimary'],
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colors['textSecondary'], width: 2.0),
              )
            ),
            cursorColor: colors['special'],
            autofocus: true,
          ),

          ElevatedButton(onPressed: (){
            Provider.of<UserProvider>(context, listen: false).setField(item.toLowerCase());
            Navigator.pop(context);
          }, child: const Text('Zapisz'))
        ],
      ),
    );
  }
}
