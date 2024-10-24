import 'dart:convert';
import 'dart:developer' as console;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final CheckboxController _isForJunior = CheckboxController();
  final CheckboxController _isActive = CheckboxController();
  final CheckboxController _isAdditional = CheckboxController();

  String? _nameError;
  String? _billingAmountError;
  String? _startDateError;

  @override
  void initState() {
    super.initState();

    final contribution = widget.contribution;

    _name.text = contribution.name;
    _billingAmount.text = contribution.billingAmount.toStringAsFixed(2);
    _startDate.text = contribution.startDate;
    _isForJunior.value = contribution.isForJunior;
    _isActive.value = contribution.isActive;
    _isAdditional.value = contribution.isAdditional;
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

            var dateFormat = DateFormat('dd.MM.yyyy');
            var substituteDateFormat = DateFormat('dd.MM.yyyy');

            if (_name.text.trim() == '') {
              setState(() {
                _nameError = 'To pole nie może być puste';
              });

              validated = false;
            }

            if (_billingAmount.text.trim() == '') {
              setState(() {
                _billingAmountError = 'To pole nie może być puste';
              });

              validated = false;
            } else if (double.tryParse(_billingAmount.text) == null) {
              setState(() {
                _billingAmountError = 'Kwota musi być liczbą';
              });

              validated = false;
            }

            if (substituteDateFormat.tryParse(_startDate.text) == null) {
              setState(() {
                _startDateError = 'Podaj prawidłową datę (dd-MM-yyyy)';
              });

              validated = false;
            }

            if (dateFormat.tryParse(_startDate.text) == null) {
              setState(() {
                _startDateError = 'Podaj prawidłową datę (dd.MM.yyyy)';
              });

              validated = false;
            }

            if (validated) {
              PopupAlert.close(context);

              ContributionModel contribution = widget.contribution.copyWith(
                name: _name.text,
                billingAmount: double.parse(_billingAmount.text),
                startDate: dateFormat.format(dateFormat.tryParse(_startDate.text)
                  ?? substituteDateFormat.parse(_startDate.text)),
                isForJunior: _isForJunior.value,
                isActive: _isActive.value,
                isAdditional: _isAdditional.value
              );

              console.log(contribution.startDate);

              if (widget.onSuccess != null) widget.onSuccess!(contribution);
            }
          },
          child: const Text('Zapisz'),
        ),
      ],
      children: <Widget>[
        TextInput(
          controller: _name,
          label: 'Nazwa składki',
          error: _nameError,
        ),
        TextInput(
          controller: _billingAmount,
          label: 'Kwota',
          type: TextInputType.number,
          error: _billingAmountError
        ),
        TextInput(
          controller: _startDate,
          label: 'Data rozpoczęcia',
          pattern: RegExp(r'^[0-9\.\-]*$'),
          error: _startDateError,
        ),
        LabeledCheckbox(
          controller: _isForJunior,
          label: 'Dla juniora',
        ),
        LabeledCheckbox(
          controller: _isActive,
          label: 'Aktywna',
        ),
        LabeledCheckbox(
          controller: _isAdditional,
          label: 'Dodatkowa',
        ),
      ],
    );
  }
}
