import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/contributions/contribution_detail_popup.dart';

import 'package:mariner/models/contribution_model.dart';

class ContributionsList extends StatelessWidget {
  const ContributionsList({super.key, required this.contributions, this.onDelete});

  final List<ContributionModel> contributions;
  final Function(int)? onDelete;

  String _limitTextLength(String text, int limit) {
    if (text.length <= limit - 3) return text;

    return '${text.substring(0, limit - 3).trim()}...';
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return ListView.builder(
      itemCount: contributions.length,
      itemBuilder: (context, index) {
        final contribution = contributions[index];

        return Row(
          children: <Widget>[
            const SizedBox(height: 48.0), // set row height to 48 px
            ActiveIndicator(active: contribution.isActive),
            const SizedBox(width: 8.0),
            Text(_limitTextLength(contribution.name, 18)),
            const SizedBox(width: 8.0),
            Text(
              contribution.startDate,
              style: TextStyle(color: colors['textSecondary']),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => ContributionDetailPopup(
                      contribution: contribution,
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (context) => PopupAlert(
                            title: 'Potwierdzenie usunięcia',
                            actionsBuilder: (context) => [
                              TextButton(
                                onPressed: () {
                                  PopupAlert.close(context);
                                },
                                child: const Text('Nie'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (onDelete != null) onDelete!(index);

                                  PopupAlert.close(context);
                                },
                                child: const Text('Tak'),
                              ),
                            ],
                            children: <Widget>[
                              Text('Czy na pewno chcesz usunąć składkę o nazwie "${contribution.name}"?')
                            ],
                          )
                        );
                      },
                      onEdit: () {},
                    )
                  );
                },
                icon: const Icon(Icons.more_vert)
            )
          ],
        );
      }
    );
  }
}

class ActiveIndicator extends StatelessWidget {
  const ActiveIndicator({super.key, this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(4.0),
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.green : Colors.red,
      ),
    );
  }
}

