import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/core/api_result/api_result.dart';
import 'package:login/core/params/params.dart';
import 'package:login/features/user/domain/repositories/repo.dart';

class UserFacade {
  final IUserRepo _userRepo;

  UserFacade({required IUserRepo userRepo}) : _userRepo = userRepo;

  Future<ApiResult<User>> login(Params params) {
    return _userRepo.login(params);
  }

  Future<ApiResult<User>> loginWithGoogle() {
    return _userRepo.loginWithGoogle();
  }

  Future<void> logout() {
    return _userRepo.logout();
  }

  Future<ApiResult<void>> signUp(Params params) {
    return _userRepo.signUp(params);
  }

  User? get user => _userRepo.user;

  Stream<User?> get userStream => _userRepo.userStream;
}
