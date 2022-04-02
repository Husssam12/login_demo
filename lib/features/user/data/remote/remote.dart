import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/core/excepations/wrapper.dart';
import 'package:login/features/user/domain/params/login_params.dart';
import 'package:login/features/user/domain/params/sing_up_params.dart';

class UserRemote {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> login(LoginParams loginParams) {
    return throwAppException(
      () {
        return _firebaseAuth.signInWithEmailAndPassword(
          password: loginParams.password,
          email: loginParams.email,
        );
      },
    );
  }

  Future<UserCredential> signUp(SignUpParams signUpParams) {
    return throwAppException(
      () {
        return _firebaseAuth
            .createUserWithEmailAndPassword(
          email: signUpParams.email,
          password: signUpParams.password,
        )
            .then(
          (value) {
            value.user!.updateDisplayName(signUpParams.name);
            return value;
          },
        );
      },
    );
  }

  Future<void> logout() {
    return throwAppException(
          () {
        return _firebaseAuth.signOut();
      },
    );
  }

  Future<UserCredential> loginWithGoogle() {
    return throwAppException(
      () async {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      },
    );
  }
}
