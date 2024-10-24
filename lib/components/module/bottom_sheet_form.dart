import 'package:flutter/material.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/theme/colors.dart';

class BottomSheetForm extends StatelessWidget {
  const BottomSheetForm({
    super.key,
    required this.title,
    required this.actions,
    required this.children,
  });

  final String title;
  final List<Widget> actions;
  final List<Widget> children;


  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),),
        color: colors['secondary'],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderTitle(title: title),
          ...children,
          const SizedBox(height: 8.0),
          ...actions
        ],
      ),

    );
  }
}