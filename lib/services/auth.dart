


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<User?> signInWithGoogle() async {
    try {
      // Begin interactive sign-in process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Finally, let's sign in
      final authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      return authResult.user;
    } catch (e) {
      // Handle any errors that occur during the sign-in process
      print("Google Sign-In Error: $e");
      return null;
    }
  }
}
