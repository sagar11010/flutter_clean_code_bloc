import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class CheckLoginEvent extends LoginEvent {
  final String email;
  final String password;

  CheckLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
