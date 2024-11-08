import 'package:flutter/material.dart';
import 'package:wallet/blocs/user/user_bloc.dart';
import 'package:wallet/models/user_model.dart';
import 'package:wallet/shared/theme.dart';
import 'package:wallet/ui/widgets/buttons.dart';
import 'package:wallet/ui/widgets/forms.dart';
import 'package:wallet/ui/widgets/transfer_recent_user_item.dart';
import 'package:wallet/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

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
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          usernameController.text.isEmpty ? buildRecentUsers() : buildResult()
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomeFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
          spacing: 20,
          runSpacing: 20,
          children: const [
            const TransferResultUserItem(
              imageUrl: 'assets/images/friend_1.png',
              name: 'Megawati',
              username: 'Megawati',
              isVerified: true,
            ),
            const TransferResultUserItem(
              imageUrl: 'assets/images/friend_2.png',
              name: 'Matthew',
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
