import 'package:login/core/user_provider.dart';
import 'package:login/features/user/application/facade.dart';
import 'package:login/features/user/data/remote/remote.dart';
import 'package:login/features/user/data/repositories/repo.dart';
import 'package:login/features/user/domain/repositories/repo.dart';
import 'package:login/features/user/presentation/pages/login/bloc/login_bloc.dart';
import 'package:login/features/user/presentation/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:login/features/user/presentation/pages/welcome/welcome/welcome_bloc.dart';

import '../service_locator.dart';

Future<void> user() async {
  si.registerSingleton(UserRemote());

  si.registerLazySingleton<IUserRepo>(
    () => UserRepo(userRemote: si()),
  );

  si.registerLazySingleton<UserFacade>(
    () => UserFacade(userRepo: si()),
  );

  si.registerFactory(() => WelcomeBloc(si()));

  si.registerFactory(() => LoginBloc(si()));

  si.registerFactory(() => SignUpBloc(si()));

  si.registerFactory(() => UserProvider(si()));
}
