import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({super.key, required this.fieldName, required this.data, this.onTap });

  final String fieldName;
  final String data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$fieldName: ', style: const TextStyle(fontSize: 16.0),),
        Expanded(child: Text(data, style: const TextStyle(fontSize: 16.0),)),
        IconButton(onPressed: onTap, icon: const Icon(Icons.edit) )
      ],
    );
  }
}