import 'package:flutter/material.dart';
import 'package:wallet/shared/theme.dart';
import 'package:wallet/ui/widgets/bank_item.dart';
import 'package:wallet/ui/widgets/buttons.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Vincent Etwin Mangapul',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BankItem(
            title: 'BANK BCA',
            imageUrl: 'assets/images/BCA.png',
            isSelected: true,
          ),
          BankItem(
            title: 'BANK BNI',
            imageUrl: 'assets/images/BNI.png',
          ),
          BankItem(
            title: 'BANK MANDIRI',
            imageUrl: 'assets/images/MANDIRI.png',
          ),
          BankItem(
            title: 'BANK OCBC',
            imageUrl: 'assets/images/OCBC.png',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
