import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/text_input.dart';

import 'package:mariner/models/dictionary_item_model.dart';

class DictionaryItemEditFormPopup extends StatefulWidget {
  const DictionaryItemEditFormPopup({super.key, required this.item, this.onEdit});

  final DictionaryItemModel item;
  final Function(DictionaryItemModel)? onEdit;

  @override
  State<DictionaryItemEditFormPopup> createState() => _DictionaryItemEditFormPopupState();
}

class _DictionaryItemEditFormPopupState extends State<DictionaryItemEditFormPopup> {
  final TextEditingController _name = TextEditingController();

  String? _nameError;

  @override
  void initState() {
    super.initState();

    final item = widget.item;
    _name.text = item.name;
  }

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Edycja pojęcia',
      actionsBuilder: (context) => [
        TextButton(
          onPressed: () {
            PopupAlert.close(context);
          },
          child: const Text('Anuluj'),
        ),
        ElevatedButton(
          onPressed: () {
            bool validated = true;

            if (_name.text.trim() == '') {
              setState(() {
                _nameError = 'To pole nie może być puste';
              });

              validated = false;
            }

            if (validated && widget.onEdit != null) {
              PopupAlert.close(context);

              final DictionaryItemModel item = widget.item.copyWith(
                name: _name.text.trim()
              );

              widget.onEdit!(item);
            }
          },
          child: const Text('Zapisz'),
        ),
      ],
      children: <Widget>[
        TextInput(
          controller: _name,
          label: 'Nazwa pojęcia',
          error: _nameError,
          required: true,
        )
      ],
    );
  }
}
