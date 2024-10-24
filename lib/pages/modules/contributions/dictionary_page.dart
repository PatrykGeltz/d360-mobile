import 'dart:developer' as console;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mariner/components/contributions/dictionary_list.dart';

import 'package:mariner/models/dictionary_item_model.dart';

@RoutePage()
class ContributionsDictionaryPage extends StatelessWidget {
  const ContributionsDictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<DictionaryItemModel> items = [
      DictionaryItemModel(name: 'Słowo 1'),
      DictionaryItemModel(name: 'Słowo 2'),
      DictionaryItemModel(name: 'Słowo 3'),
      DictionaryItemModel(name: 'Słowo 4'),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DictionaryList(
        items: items,
        onDelete: (index) {
          final item = items[index];

          console.log('Delete item "${item.name}"');
        },
        onEdit: (index, newItem) {
          final item = items[index];

          console.log('Edited item ${item.name}');
        }
      ),
    );
  }
}
