import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountController {

  late UserCredential credential;
  bool isConnected = false;
  bool isDataReady = false;
  late User user;

  List<Map> newsList = [];

  Future<bool> init() async {
    isConnected = await checkAuth();
    if (isConnected)
    {
      return true;
    }

    return false;
  }

   Future<bool> checkAuth() async {

    bool connected = false;
    final result = await FirebaseAuth.instance.authStateChanges().first;
    if (result == null) {
      connected = false;
    } else {
      user = result;
      connected = true;
    }
    return connected;
    
  }

  Future<String> logInAuth(String emailAddress, String password) async {
    String error = "";
    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
      user = credential.user!;
    } on FirebaseAuthException catch (e) 
    {
      error = e.code;
      if (e.code == 'user-not-found') {
        // Utilisateur non retrouvé
      } else if (e.code == 'wrong-password') {
        // Mot de passe incorrect
      }
    }
    return error;
  }

  Future<bool> registerNewUser(String mail, String password, Map<String, dynamic> formData) async {

    final db = FirebaseFirestore.instance;
    try
    {
      // Créer le nouveau compte auth
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password)
      .then((credential) async
      {
        await db.collection('Account').doc(credential.user!.email).set(formData);
      });

    }
    catch (e)
    {
      return false;
    }

    return true;
  }

}

late AccountController account;