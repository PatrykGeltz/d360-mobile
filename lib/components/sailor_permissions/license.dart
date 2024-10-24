import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';

class License extends StatelessWidget {
  const License({
    super.key,
    required this.name,
    required this.licenseNumber,
    required this.obtainingDate
  });

  final String name;
  final String licenseNumber;
  final String obtainingDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.badge),
        const SizedBox(width: 8.0,),
        Expanded(child: Text(name)),
        IconButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return PopupAlert(
                title: name,
                children: [
                  Text('Nr licencji: $licenseNumber'),
                  Text('Data wyadania: $obtainingDate')
                ],
                actionsBuilder: (context){
                  return [
                    ElevatedButton(onPressed: (){
                      PopupAlert.close(context);
                    }, child: const Text('Usuń')),
                    ElevatedButton(onPressed: (){
                      PopupAlert.close(context);
                    }, child: const Text('Edytuj')),
                  ];
                } );
          });
        }, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
