import 'package:login/core/app_manger/app_manger_bloc.dart';
import 'package:login/service_locator/service_locator.dart';

Future<void> core() async {
  si.registerSingleton(AppMangerBloc());
}
