import 'package:flutter/material.dart';

import 'package:mariner/models/dictionary_item_model.dart';

class DictionaryList extends StatelessWidget {
  const DictionaryList({super.key, required this.items});

  final List<DictionaryItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Row(
          children: <Widget>[
            const SizedBox(height: 48.0), // Set height of a row
            Text(item.name),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        );
      },
    );
  }
}
