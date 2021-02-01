import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpusmall/models/user.dart';
import 'package:helpusmall/service/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

 //create user objeto baseado on FireBaseUser
 User _userFromFirebaseUser(FirebaseUser user){
   return user != null ? User(uid: user.uid) : null;
 } 
 // auth changed user Stream
 Stream<User> get user {
   return _auth.onAuthStateChanged
   // Muda oId no user para um usuario Customizado
    .map(_userFromFirebaseUser);
 }
  //sign in anomino
  Future signInAnom() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in email & passaword
  Future login(String email,String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email:  email, password: password); 
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // register with email & password
  Future register(String email,String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email:  email, password: password); 
      FirebaseUser user = result.user;
      
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('nome do produto', 'descricao do produto', 100);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // signout
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}