import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

class PopupAlert extends StatelessWidget {
  const PopupAlert({
    super.key,
    required this.title,
    required this.children,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  final String title;
  final List<Widget> children;
  final String? confirmText; // Optional confirm button text
  final String? cancelText;  // Optional cancel button text
  final VoidCallback? onConfirm; // Optional confirm action
  final VoidCallback? onCancel;  // Optional cancel action

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return AlertDialog(
      backgroundColor: colors['background'],
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: children,
        ),
      ),
      actions: <Widget>[
        // Optional Cancel Button
        if (cancelText != null)
          TextButton(
            child: Text(cancelText!),
            onPressed: () {
              if (onCancel != null) {
                onCancel!(); // Call custom onCancel handler
              }
              Navigator.of(context).pop();
            },
          ),
        // Optional Confirm Button
        if (confirmText != null)
          ElevatedButton(
            child: Text(confirmText!),
            onPressed: () {
              if (onConfirm != null) {
                onConfirm!(); // Call custom onConfirm handler
              }
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        // Default Close Button if no confirm/cancel provided
        if (confirmText == null && cancelText == null)
          TextButton(
            child: const Text('Zamknij'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      ],
    );
  }
}
