import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_code_structure/domain/entities/login_request_params.dart';
import 'package:clean_code_structure/domain/usecase/auth/login_user.dart';
import 'package:clean_code_structure/features/auth/presentation/blocs/login/login_event.dart';
import 'package:clean_code_structure/features/auth/presentation/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUseCase;

  LoginBloc(this.loginUseCase) : super(InitialLoginState());

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is CheckLoginEvent) {
      yield CheckingLoginState();
      final result = await loginUseCase.call(
        LoginRequestParams(userName: event.email, password: event.password),
      );
      yield result.fold(
        (failure) => ErrorLoggedState(),
        (value) => (value) ? LoggedState() : ErrorLoggedState(),
      );
    }
  }
}
