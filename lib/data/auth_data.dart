import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/data/fairstore.dart';

abstract class AuthenticationDatasource {
  Future<void> register(String email, String Password, String passwordConfirm);
  Future<void> login(String email, String Password);
}

class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<void> login(String email, String Password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: Password.trim(),
    );
  }

  @override
  Future<void> register(
    String email,
    String Password,
    String passwordConfirm,
  ) async {
    if (Password != passwordConfirm) {
      throw Exception('Passwords do not match');
    }
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email.trim(),
          password: Password.trim(),
        )
        .then((value) {
          Fairstore_Datasource().CreateUser(email);
        });
  }
}
