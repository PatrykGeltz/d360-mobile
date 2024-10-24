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
  const TextInput({
    super.key,
    required this.controller,
    this.placeholder,
    this.label,
    this.error,
    this.type,
    this.required = false,
    this.onTap,
    this.readOnly = false, // Nowy parametr readOnly
  });

  final TextEditingController controller;
  final String? placeholder;
  final String? label;
  final String? error;
  final TextInputType? type;
  final bool required;
  final VoidCallback? onTap;
  final bool readOnly; // Czy pole tekstowe jest tylko do odczytu

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return GestureDetector(
      onTap: onTap, // Wywołanie onTap tylko wtedy, gdy jest ustawione
      child: AbsorbPointer(
        absorbing: readOnly, // Użycie parametru readOnly
        child: TextField(
          controller: controller,
          style: TextStyle(color: colors['textPrimary']),
          keyboardType: type,
          inputFormatters: type == TextInputType.number
              ? <TextInputFormatter>[DecimalTextInputFormatter()]
              : null,
          decoration: InputDecoration(
            hintText: placeholder,
            labelText: label != null && required ? '$label*' : null,
            errorText: error,
            hintStyle: TextStyle(color: colors['textSecondary']),
            labelStyle: TextStyle(color: colors['textSecondary']),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: colors['textPrimary'].withOpacity(0.5),
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: colors['primary']!,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
