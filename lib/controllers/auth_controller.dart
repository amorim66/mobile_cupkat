import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> signUpUsers(String email, String fullName, String phoneNumber,
      String password) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
        //Create the users

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

            res = 'success';
      } else {
        res = 'Os campos não podem estar vazios';
      }
    } catch (e) {}

    return res;
  }
}
