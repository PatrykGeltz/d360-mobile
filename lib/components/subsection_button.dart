import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

class SubsectionButton extends StatelessWidget {
  const SubsectionButton({super.key, required this.title, required this.icon, this.onPressed});

  final IconData icon;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return RawMaterialButton(
      fillColor: colors['background'],
      elevation: 0.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),

      onPressed: onPressed,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16.0),
            Text(title)
          ],
        ),
      ),
    ) ;
  }
}
