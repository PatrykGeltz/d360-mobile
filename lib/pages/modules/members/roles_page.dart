import 'dart:developer' as console;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MembersRolesPage extends StatelessWidget {
  static const String id = '/members/roles';

  const MembersRolesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              ElevatedButton(onPressed: (){
                showModalBottomSheet(context: context, builder: (BuildContext context){
                  return Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Dodaj rolę', style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25.0,
                        ), ),

                        const Text('Nazwa roli'),
                        TextField(
                          autofocus: true,
                          maxLength: 20,
                          onChanged: (value){
                            console.log(value);
                          },
                        )
                      ],
                    ),
                  );
                } );
              }, child: const Text('Dodaj nową role'))
            ],
          ),
          const SizedBox(height: 20.0,),
          const Row(
            children: [
              SizedBox(width: 20.0),
              Text('Kolor'),
              SizedBox(width: 20.0),
              Text('Nazwa'),
              Expanded(child: SizedBox()),
              Text('Opcje'),
              SizedBox(width: 20.0,)
            ],
          ),
           Row(
            children: [
              const SizedBox(width: 30.0),
              const CircleAvatar(backgroundColor: Colors.red, radius: 10.0,),
              const SizedBox(width: 25.0),
              const Text('Role layout'),
              const Expanded(child: SizedBox()),
              IconButton(onPressed: (){console.log('edit item');}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: (){console.log('delete item');}, icon: const Icon(Icons.delete)),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30.0),
              const CircleAvatar(backgroundColor: Colors.blue, radius: 10.0,),
              const SizedBox(width: 25.0),
              const Text('Role layout'),
              const Expanded(child: SizedBox()),
              IconButton(onPressed: (){console.log('edit item');}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: (){console.log('delete item');}, icon: const Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }
}

// Table(
//   columnWidths: const {
//     0: IntrinsicColumnWidth(),
//     1: FlexColumnWidth(),
//     2: IntrinsicColumnWidth()
//   },
//   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//   children: const <TableRow>[
//     TableRow(
//       children: [
//         TableCell(child: Text('Kolor')),
//         TableCell(child: Text('Nazwa')),
//         TableCell(child: Text('Opcje')),
//       ]
//     )
//   ],
// )
