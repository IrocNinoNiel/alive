import 'package:firebase_auth/firebase_auth.dart';
import 'package:mob_prog_project/data/authentication/auth.dart';

class AuthenticationRepository {
  Future signInUser(String email, String password) =>
      AuthService().signInUser(email, password);

  Future registerUser(String email, String password) =>
      AuthService().registerUser(email, password);

  Future signOut() => AuthService().signOut();

  Future isSignIn() => AuthService().isSignIn();

  Future<FirebaseUser> getCurrentUser() => AuthService().getCurrentUser();
}
