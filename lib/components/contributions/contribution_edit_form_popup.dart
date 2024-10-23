import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/text_input.dart';
import 'package:mariner/components/module/labeled_checkbox.dart';

import 'package:mariner/models/contribution_model.dart';

class ContributionEditFormPopup extends StatefulWidget {
  const ContributionEditFormPopup({super.key, required this.contribution, this.onSuccess});

  final ContributionModel contribution;
  final Function(ContributionModel)? onSuccess;

  @override
  State<ContributionEditFormPopup> createState() => _ContributionEditFormPopupState();
}

class _ContributionEditFormPopupState extends State<ContributionEditFormPopup> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _billingAmount = TextEditingController();
  final TextEditingController _startDate = TextEditingController();

  @override
  void initState() {
    super.initState();

    final contribution = widget.contribution;

    _name.text = contribution.name;
    _billingAmount.text = contribution.billingAmount.toStringAsFixed(2);
    _startDate.text = contribution.startDate;
  }

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Edycja składki',
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

            if (validated) {
              PopupAlert.close(context);

              ContributionModel contribution = widget.contribution.copyWith(
                name: _name.text,
                billingAmount: double.parse(_billingAmount.text)
              );

              if (widget.onSuccess != null) widget.onSuccess!(contribution);
            }
          },
          child: const Text('Zapisz'),
        ),
      ],
      children: <Widget>[
        TextInput(
          controller: _name,
          label: 'Nazwa składki'
        ),
        TextInput(
          controller: _billingAmount,
          label: 'Kwota',
          type: TextInputType.number,
        ),
        TextInput(
          controller: _startDate,
          label: 'Data rozpoczęcia',
        ),
        LabeledCheckbox(
          controller: CheckboxController(),
          label: 'Dla juniora',
        )
      ],
    );
  }
}
