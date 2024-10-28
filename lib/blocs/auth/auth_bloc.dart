import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallet/models/signup_form_model.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/ui/pages/data_provider_pages.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email SUdah Terpakai'));
          }
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
