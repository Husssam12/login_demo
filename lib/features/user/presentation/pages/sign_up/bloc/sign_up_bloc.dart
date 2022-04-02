import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:login/features/user/domain/params/sing_up_params.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../application/facade.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._userFacade) : super(SignUpInitial()) {
    on<SignUpEvent>(_handler);
  }

  final UserFacade _userFacade;

  static const emailControllerName = 'email';
  static const passwordControllerName = 'password';
  static const nameControllerName = 'name';

  final FormGroup form = FormGroup(
    {
      nameControllerName: FormControl(
        validators: [
          Validators.required,
        ],
      ),
      emailControllerName: FormControl(
        validators: [
          Validators.compose([
            Validators.email,
            Validators.required,
          ])
        ],
      ),
      passwordControllerName: FormControl(
        validators: [Validators.required],
      ),
    },
  );

  FutureOr<void> _handler(SignUpEvent event, Emitter<SignUpState> emit) async {
    if (event is SignUpSubmitted) {
      await _mapSubmitted(emit);
    } else if (event is SignUpCanceled) {
      _mapSignUpCanceled();
    }
  }

  void _mapSignUpCanceled() {
    final state = this.state;
  }

  Future<void> _mapSubmitted(Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    final result = await _userFacade.signUp(SignUpParams.fromMap(
      form.value,
    ));
    result.when(
      success: (data) => emit(SignUpSuccess()),
      failure: (message) => emit(SignUpFailure(message)),
    );
  }
}
