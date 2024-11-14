import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet/models/transaction_model.dart';
import 'package:wallet/shared/shared_metod.dart';
import 'package:wallet/shared/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          Image.network(
            thumbnail(),
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(
              transaction.amount ?? 0,
              symbol: transaction.transactionType?.action == 'cr' ? '+ ' : '-',
            ),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
  String thumbnail() {
    if (transaction.transactionType?.code == 'transfer') {
      return 'https://bwabank.my.id/storage/Nmmdj2yh1D.png';
    } else if (transaction.transactionType?.code == 'top_up') {
      return 'https://bwabank.my.id/storage/xmamMx8utB.png';
    } else {
      return 'https://bwabank.my.id/storage/tL3YMHgck4.png';
    }
  }
}
