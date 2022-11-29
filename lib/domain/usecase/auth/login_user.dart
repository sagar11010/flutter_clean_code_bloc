import 'package:dartz/dartz.dart';
import 'package:clean_code_structure/domain/entities/login_request_params.dart';
import 'package:clean_code_structure/domain/repositories/authentication_repository.dart';

import '../../entities/app_error.dart';
import '../usecase.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async =>
      _authenticationRepository.loginUser(params.toJson());
}
