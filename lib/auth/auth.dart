import 'package:firebase_auth/firebase_auth.dart';
import 'package:matjar_login_signup/firebase/userDatabase.dart';
import '../modules/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  Userinit _userFromFirebaseUser(User user) {
    return user != null ? Userinit(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Userinit> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  // sign in with email and password for seller
  Future loginSeller(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  // register with email and password :BUYER
  Future signup(String email, String password, String fn, String ln) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((auth) {
        DatabaseService(uid: auth.user.uid)
            .userSetup(fn, ln, email, " ", " ", "EGP");
        DatabaseService(uid: auth.user.uid).darkmodeSetup(false);
        DatabaseService(uid: auth.user.uid).isSellerSetup(false);
      });
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.toString()}");
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  // register with email and password : SELLER
  Future signupSeller(
      String email, String password, String fn, String ln) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((auth) {
        DatabaseService(uid: auth.user.uid)
            .userSetup(fn, ln, email, " ", " ", "EGP");
        DatabaseService(uid: auth.user.uid).darkmodeSetup(false);
        DatabaseService(uid: auth.user.uid).isSellerSetup(true);
      });
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.toString()}");
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
