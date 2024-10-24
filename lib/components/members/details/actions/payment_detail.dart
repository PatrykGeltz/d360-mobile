import 'package:flutter/material.dart';

// components
import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/danger_button.dart';
import 'payment_edit.dart';
import 'payment_confirm_delete.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({
    super.key,
    required this.amount,
    required this.date,
    required this.paymentMethod,
    required this.status
  });

  final double amount;
  final String date;
  final String paymentMethod;
  final String status;
  @override
  Widget build(BuildContext context) {
    return PopupAlert(
        title: 'Szczegóły',
        children: [
          Text('Kwota: $amount'),
          Text('Metoda płatności: $paymentMethod'),
          Text('Data: $date'),
          Text('Status: $status'),
        ],
        actionsBuilder: (context) {
          return [
            DangerButton(
                onPressed: () {
                  PopupAlert.close(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const PaymentConfirmDelete();
                      });
                },
                title: 'Usuń'),
            ElevatedButton(
                onPressed: () {
                  PopupAlert.close(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const PaymentEdit();
                      });
                },
                child: const Text('Edytuj')),
          ];
        });
  }
}
