import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/blocs/auth/auth_bloc.dart';
import 'package:wallet/blocs/user/user_bloc.dart';
import 'package:wallet/shared/theme.dart';
import 'package:wallet/ui/pages/data_package_page.dart';
import 'package:wallet/ui/pages/data_provider_pages.dart';
import 'package:wallet/ui/pages/data_success_page.dart';
import 'package:wallet/ui/pages/home_page.dart';
import 'package:wallet/ui/pages/onbording_page.dart';
import 'package:wallet/ui/pages/pin_page.dart';
import 'package:wallet/ui/pages/profile_edit_page.dart';
import 'package:wallet/ui/pages/profile_edit_pin_page.dart';
import 'package:wallet/ui/pages/profile_edit_success.dart';
import 'package:wallet/ui/pages/profile_page.dart';
import 'package:wallet/ui/pages/sign_in_page.dart';
import 'package:wallet/ui/pages/sign_up_page.dart';
import 'package:wallet/ui/pages/sign_up_success_page.dart';
import 'package:wallet/ui/pages/splash_page.dart';
import 'package:wallet/ui/pages/topup_page.dart';
import 'package:wallet/ui/pages/topup_success.dart';
import 'package:wallet/ui/pages/transfer_page.dart';
import 'package:wallet/ui/pages/transfer_success_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            appBarTheme: AppBarTheme(
              backgroundColor: lightBackgroundColor,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: blackColor,
              ),
              titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            )),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnbordingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccess(),
          '/topup': (context) => const TopupPage(),
          '/topup-success': (context) => const TopupSuccess(),
          '/tranfer': (context) => const TransferPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPages(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
