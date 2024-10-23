import 'package:flutter/material.dart';

class CheckboxController extends ChangeNotifier {
  CheckboxController({bool? value}) {
    if (value != null) _value = value;
    notifyListeners();
  }

  bool _value = false;

  bool get value => _value;

  set value(bool newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }

  toggle() {
    _value = !_value;
    notifyListeners();
  }
}

class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({super.key, required this.controller, required this.label});

  final CheckboxController controller;
  final String label;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: widget.controller.value,
          onChanged: (newValue) {
            if (newValue != null) {
              widget.controller.value = newValue; // Update the controller value
            }
          },
        ),
        Text(widget.label)
      ],
    );
  }
}
