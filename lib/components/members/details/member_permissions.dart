import 'package:flutter/material.dart';
import 'license.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/theme/colors.dart';

class MemberPermissions extends StatelessWidget {
  const MemberPermissions({
    super.key,
    required this.permissions
  });

  final List<License> permissions;

  final double margin = 16.0;
  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Column(
      children: [
        const HeaderTitle(title: 'Lista uprawnień'),
        SizedBox(height: margin,),

        if(permissions.isEmpty) Text('Brak uprawnień', style: TextStyle(color: colors['textSecondary']),)
        else ...permissions
      ],
    );
  }
}
