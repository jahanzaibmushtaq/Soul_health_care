import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';

class AuthServices {
  static final AuthServices _authInstance = AuthServices._initialization();

  AuthServices._initialization();

  factory AuthServices() {
    return _authInstance;
  }

  static AuthServices get authInstance => _authInstance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  User? getUser() {
    user = _firebaseAuth.currentUser;
  }


  AuthProvider? getSignInProvider() {
    switch (_firebaseAuth.currentUser!.providerData[0].providerId) {
      case "google.com":
        return AuthProvider.google;
      case "facebook.com":
        return AuthProvider.facebook;
    }
    return null;
  }

  Future<bool> checkUserExistOrNot(String email) async {
    List emailList = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    if (emailList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout()async{
    _googleSignIn.signOut();
    _firebaseAuth.signOut();
  }
  Future<String?> getUserEmail() async {
    final user = _firebaseAuth.currentUser;
    return user?.email;
  }
  static String? getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

}
