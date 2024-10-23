import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mariner/theme/colors.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'^[0-9]+(\.[0-9]{0,2})?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (_regExp.hasMatch(newValue.text) || newValue.text.isEmpty) {
      return newValue; // Accept the new input if it's valid or empty
    }
    return oldValue; // Ignore invalid input and keep the old value
  }
}

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.controller, this.placeholder, this.label, this.type});

  final TextEditingController controller;
  final String? placeholder;
  final String? label;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return TextField(
      controller: controller,
      style: TextStyle(color: colors['textPrimary']),
      keyboardType: type,
      inputFormatters: type == TextInputType.number
        ? <TextInputFormatter>[DecimalTextInputFormatter()] : null,
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: label,
        hintStyle: TextStyle(color: colors['textSecondary']),
        labelStyle: TextStyle(color: colors['textSecondary']),

        // Default underline border
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors['textPrimary'].withOpacity(0.5), // Text primary with 0.5 opacity
            width: 1.0, // Width of 1 for the default state
          ),
        ),

        // Underline border when focused
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors['primary']!, // Primary color when focused
            width: 2.0, // Width of 2 for the focused state
          ),
        ),
      ),
    );
  }
}
