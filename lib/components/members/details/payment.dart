import 'package:flutter/material.dart';
import 'actions/payment_detail.dart';

class Payment extends StatelessWidget {
  const Payment({
    super.key,
    required this.amount,
    this.paymentMethod = 'Brak danych',
    this.date = 'Brak danych',
    this.status = 'Brak danych'
  });

  final double amount;
  final String paymentMethod;
  final String date;
  final String status;

  final double margin = 16.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) {
            return PaymentDetail(amount: amount, date: date, paymentMethod: paymentMethod, status: status);
          });
      },
      child: Row(
        children: [
          const Icon(Icons.payment),
          SizedBox(width: margin, height: margin * 2.5,),
          Expanded(child: Text('$amount zł')),
        ],
      ),
    );
  }
}
