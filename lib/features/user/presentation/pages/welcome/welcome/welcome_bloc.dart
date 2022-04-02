import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:login/features/user/application/facade.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc(this._userFacade) : super(WelcomeInitial()) {
    on<WelcomeEvent>(_handler);
  }

  FutureOr<void> _handler(
    WelcomeEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    if (event is WelcomeLoggedWithGoogle) {
      emit(WelcomeLoading());
      final result = await _userFacade.loginWithGoogle();
      result.when(
        success: (data) => emit(WelcomeSuccess()),
        failure: (message) => emit(WelcomeFailure(message)),
      );
    }
  }

  final UserFacade _userFacade;
}
