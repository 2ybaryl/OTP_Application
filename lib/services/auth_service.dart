import 'package:firebase_auth/firebase_auth.dart';
import 'package:otp_app/services/ntp_service.dart';
import 'package:otp_app/services/express_connect.dart';
import 'package:otp_app/global/globals.dart' as globals;
// import 'package:otp_app/screens/otpdis.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      var d = await checkTime();
      var res = await makePostReq(email: email, delay: d);
      globals.res = res.body;
      return res.body;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return '';
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var d = await checkTime();
      await makePostReq(email: email, delay: d);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
