import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mariner/theme/colors.dart';

class DateController extends ChangeNotifier {
  DateTime _date = DateTime.now();

  DateController({DateTime? date}) {
    if (date != null) _date = date;

    notifyListeners();
  }

  set date(DateTime value) {
    _date = value;

    notifyListeners();
  }

  DateTime get date => _date;
}

class DateInput extends StatefulWidget {
  const DateInput({super.key, required this.controller});

  final DateController controller;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return GestureDetector(
      onTap: () async {
        final newDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1970),
            lastDate: DateTime(275760, 9, 13),
            initialDate: widget.controller.date
        );

        if (newDate != null) widget.controller.date = newDate;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 48.0,
        decoration: BoxDecoration(
          color: colors['secondary'],
          borderRadius: const BorderRadius.all(Radius.circular(8.0))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Text(DateFormat('dd.MM.yyyy').format(widget.controller.date))),
            const Icon(Icons.calendar_month_outlined),
          ],
        ),
      ),
    );
  }
}
