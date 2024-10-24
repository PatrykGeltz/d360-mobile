import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

class DangerButton extends StatelessWidget {
  const DangerButton({super.key, required this.title, this.onPressed, this.outlined = true});

  final String title;
  final VoidCallback? onPressed;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    if(outlined){
      return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: colors['danger']
            )
          ),
          child: Text(title, style: TextStyle(
            color: colors['textDanger'],
          )));
    } else {
      return TextButton(
          onPressed: onPressed,
          child: Text(title, style: TextStyle(
            color: Colors.transparent,
            decoration: TextDecoration.underline,
            decorationColor: colors['danger'],
            decorationThickness: 3,
            shadows: [
              Shadow(
                  color: colors['danger'],
                  offset: const Offset(0, -5))
            ],
          )));
    }
  }
}

