import 'package:flutter/material.dart';
import 'package:wallet/shared/theme.dart';
import 'package:wallet/ui/widgets/buttons.dart';
import 'package:wallet/ui/widgets/forms.dart';
import 'package:wallet/ui/widgets/transfer_recent_user_item.dart';
import 'package:wallet/ui/widgets/transfer_result_user_item.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tranfer',
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
            'Rearch',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // buildRecentUsers(),
          buildResult(),
          const SizedBox(
            height: 274,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

Widget buildRecentUsers() {
  return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/images/friend_1.png',
            name: 'Megawati',
            username: 'Megawati',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/images/friend_2.png',
            name: 'Matthew',
            username: 'Matthew',
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/images/friend_3.png',
            name: 'Silvan',
            username: 'Silvan',
          ),
        ],
      ));
}

Widget buildResult() {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Wrap(
          spacing: 17,
          runSpacing: 17,
          children: const [
            const TransferResultUserItem(
              imageUrl: 'assets/images/friend_1.png',
              name: 'Megawati',
              username: 'Megawati',
              isVerified: true,
            ),
            const TransferResultUserItem(
              imageUrl: 'assets/images/friend_2.png',
              name: 'MAtthew',
              username: 'MAtthew',
              isVerified: true,
              isSelected: true,
            ),
          ],
        ),
      ],
    ),
  );
}
