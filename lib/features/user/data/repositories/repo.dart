import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/core/api_result/api_result.dart';
import 'package:login/core/params/params.dart';
import 'package:login/features/user/data/remote/remote.dart';
import 'package:login/features/user/domain/params/login_params.dart';
import 'package:login/features/user/domain/params/sing_up_params.dart';
import 'package:login/features/user/domain/repositories/repo.dart';

class UserRepo implements IUserRepo {
  final UserRemote _userRemote;

  UserRepo({required UserRemote userRemote}) : _userRemote = userRemote;

  @override
  Future<ApiResult<User>> login(Params params) {
    return toApiResult(
      () {
        return _userRemote
            .login(params as LoginParams)
            .then((value) => value.user!);
      },
    );
  }

  @override
  Future<ApiResult<User>> signUp(Params params) {
    return toApiResult(
      () {
        return _userRemote
            .signUp(params as SignUpParams)
            .then((value) => value.user!);
      },
    );
  }

  @override
  Future<ApiResult<User>> loginWithGoogle() {
    return toApiResult(
      () {
        return _userRemote.loginWithGoogle().then((value) => value.user!);
      },
    );
  }

  @override
  Future<void> logout() {
    return _userRemote.logout();
  }

  @override
  User? get user => FirebaseAuth.instance.currentUser;

  @override
  Stream<User?> get userStream => FirebaseAuth.instance.userChanges();
}
