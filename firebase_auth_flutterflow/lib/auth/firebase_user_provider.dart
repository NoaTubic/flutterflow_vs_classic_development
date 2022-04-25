import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseAuthFlutterflowFirebaseUser {
  FirebaseAuthFlutterflowFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FirebaseAuthFlutterflowFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FirebaseAuthFlutterflowFirebaseUser>
    firebaseAuthFlutterflowFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FirebaseAuthFlutterflowFirebaseUser>(
            (user) => currentUser = FirebaseAuthFlutterflowFirebaseUser(user));
