import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<bool> isLogin(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result != null) {
        print("Login!!");
        return true;
      }
      print("Login Fail!!");
      return false;
    } on Exception catch (e) {
      List<String> result = e.toString().split(", ");
      return false;
    }
  }
}
