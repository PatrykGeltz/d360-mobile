import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

class PopupAlert extends StatelessWidget {
  const PopupAlert({
    super.key,
    required this.title,
    required this.children,
    required this.actionsBuilder,
  });

  final String title;
  final List<Widget> children;
  final List<Widget> Function(BuildContext) actionsBuilder;

  static close(context) {
    Navigator.of(context).pop();
  }

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
      actions: actionsBuilder(context),
    );
  }
}
