import 'package:firebase_auth/firebase_auth.dart';

import 'package:dummy/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserClass? _userFromFirebaseUser(User? user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  Stream<UserClass?> get user {
    return _auth.authStateChanges().map((User? user) =>
        _userFromFirebaseUser(user));
  }

  Future signInanon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch (e) {
      print(e.toString());
      return null;
    }

  }
  Future SignInWithEmailandPassword(String email,String password)async{
    try{

      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print(result);
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


  Future registerWithEmailandPassword(String email,String password)async{
    try{
      UserCredential result=await _auth .createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;

      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}