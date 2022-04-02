import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/core/api_result/api_result.dart';
import 'package:login/core/params/params.dart';

abstract class IUserRepo {
  Future<ApiResult<User>> login(Params params);

  Future<ApiResult<User>> loginWithGoogle();

  Future<ApiResult<User>> signUp(Params params);

  Future<void> logout();

  Stream<User?> get userStream;

  User? get user;
}
