import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/router/router.dart';
import 'package:provider/provider.dart';
import 'package:login/service_locator/service_locator.dart' as si;

import 'common/theme/theme.dart';
import 'core/app_manger/app_manger_bloc.dart';
import 'firebase_options.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppMangerBloc(
        doBeforeOpen: _doBeforeOpen,
      )..add(AppMangerStarted()),
      child: Provider<AppRouter>(
        create: (context) => AppRouter(context: context),
        builder: (context, _) {
          var appRouter = context.read<AppRouter>();
          return ScreenUtilInit(
            builder: () => MaterialApp.router(
              routeInformationParser: appRouter.goRouter.routeInformationParser,
              routerDelegate: appRouter.goRouter.routerDelegate,
              title: 'Flutter Login Demo',
              theme: lightTheme,
            ),
          );
        },
      ),
    );
  }

  FutureOr<void> _doBeforeOpen() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await si.init();
  }
}
