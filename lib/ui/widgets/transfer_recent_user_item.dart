import 'package:flutter/material.dart';
import 'package:wallet/models/user_model.dart';
import 'package:wallet/shared/theme.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;

  const TransferRecentUserItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(
              right: 14,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.profilePicture == null
                    ? const AssetImage(
                        'assets/images/Profile.png',
                      )
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '@${user.username}',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: greenColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
