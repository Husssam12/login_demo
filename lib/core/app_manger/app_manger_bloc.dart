import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/features/user/application/facade.dart';
import 'package:login/service_locator/service_locator.dart';
import 'package:meta/meta.dart';

part 'app_manger_event.dart';

part 'app_manger_state.dart';

class AppMangerBloc extends Bloc<AppMangerEvent, AppMangerState> {
  AppMangerBloc({this.doBeforeOpen}) : super(const AppMangerState.initial()) {
    on<AppMangerEvent>(_handler);
  }

  late final StreamSubscription<User?> _streamSubscription;

  late final UserFacade _facade;
  final FutureOr<void> Function()? doBeforeOpen;

  FutureOr<void> _handler(
      AppMangerEvent event, Emitter<AppMangerState> emit) async {
    if (event is AppMangerStarted) {
      await doBeforeOpen?.call();
      _facade = si();
      _streamSubscription = _facade.userStream.listen(_userListener);
    } else if (event is AppMangerStateChanged) {
      emit(state.copyWith(state: event.state));
    } else if (event is AppMangerLoggedOut) {
      await _facade.logout();
    }
  }

  void _userListener(User? user) {
    late final AppState newState;
    if (user == null) {
      newState = AppState.unAuthenticated;
    } else {
      newState = AppState.authenticated;
    }
    add(AppMangerStateChanged(state: newState));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
