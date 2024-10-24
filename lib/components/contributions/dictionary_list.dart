import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/contributions/dictionary_item_edit_form_popup.dart';

import 'package:mariner/models/dictionary_item_model.dart';

class DictionaryList extends StatelessWidget {
  const DictionaryList({super.key, required this.items, this.onDelete, this.onEdit});

  final List<DictionaryItemModel> items;
  final Function(int)? onDelete;
  final Function(int, DictionaryItemModel)? onEdit;

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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DictionaryItemEditFormPopup(
                    item: item,
                    onEdit: (newItem) {
                      if (onEdit != null) onEdit!(index, newItem);
                    }
                  )
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => PopupAlert(
                    title: 'Potwierdzenie usunięcia',
                    actionsBuilder: (context) => [
                      TextButton(
                        onPressed: () {
                          PopupAlert.close(context);
                        },
                        child: const Text('Nie'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (onDelete != null) onDelete!(index);

                          PopupAlert.close(context);
                        },
                        child: const Text('Tak'),
                      ),
                    ],
                    children: <Widget>[
                      Text('Czy na pewno chcesz usunąć wpis o nazwie "${item.name}"?')
                    ],
                  )
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        );
      },
    );
  }
}
