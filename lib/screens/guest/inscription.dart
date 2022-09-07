import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate/screens/guest/login.dart';
import 'package:debate/script/accountController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  _registerPressed() async  {
    if ( mailController.text != "" && passwordController.text != "" && confirmPasswordController.text != "" && surnameController.text.toUpperCase() != "" && nameController.text != "" ) {
        if (passwordController.text == confirmPasswordController.text) {

          Map<String, dynamic> formData = {
            'karma' : 0,
            'activity' : 0,
            'fiability' : 0,
            'name' : nameController.text,
            'surname' : surnameController.text,
            'profile_url' : "https://firebasestorage.googleapis.com/v0/b/debate-workshop.appspot.com/o/pp_placeholder.png?alt=media&token=156f503d-79d4-4b62-a826-522d1e46b7af",
            'date' : Timestamp.now().millisecondsSinceEpoch
          };
          await account.registerNewUser(mailController.text, passwordController.text, formData);
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

        }
      }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child:Column(
              children: [
                SizedBox(
                        height: 75.0,
                      ),
                SizedBox(
                  width: 150.0,
                  child: Image(
                    image: AssetImage('assets/logo_debate.png'),
                    ),
                ),
                SizedBox(
                  width: 310,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      //LOGO
                      SizedBox(
                        height: 50.0,
                      ),
                      RichText(
                        text: TextSpan(
                      text: 'Bienvenue dans la\ncommunauté\nDebate',
                      style: TextStyle(fontWeight: FontWeight.w700, color: Color.fromARGB(255, 72, 72, 72), fontSize: 22, height: 1.4, fontFamily: 'Montserrat'),
                      children: [],
                      )),
                      SizedBox(
                        height: 50.0,
                      ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 290,
                            child: Text('Nom', style: theme.textAuthInputLabel)
                            ),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(controller: surnameController, decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Nom', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),
                            borderRadius: BorderRadius.circular(6.0),
                          ))),
                          SizedBox(height: 20.0),
                          Center(
                            child: SizedBox(
                              width: 290,
                            child: Text('Prénom', style: theme.textAuthInputLabel)
                            ),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(controller: nameController, decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Prénom', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),
                            borderRadius: BorderRadius.circular(6.0),
                          ))),
                          SizedBox(height: 20.0),
                          Center(
                            child: SizedBox(
                              width: 290,
                            child: Text('Adresse E-Mail', style: theme.textAuthInputLabel)
                            ),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(controller: mailController, decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Adresse E-Mail', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),
                            borderRadius: BorderRadius.circular(6.0),
                          ))),
                          SizedBox(height: 20.0),
                          Center(
                            child: SizedBox(
                              width: 290,
                            child: Text('Mot de passe', style: theme.textAuthInputLabel)
                            ),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(controller: passwordController, decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Mot de passe', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),
                            borderRadius: BorderRadius.circular(6.0),
                          ))),
                          SizedBox(height: 20.0),
                          Center(
                            child: SizedBox(
                              width: 290,
                              child: Text('Confirmer mot de passe', style: theme.textAuthInputLabel)
                            ),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(controller: confirmPasswordController, decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Confirmer mot de passe', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),
                            borderRadius: BorderRadius.circular(6.0),
                          ))),
                          SizedBox(height: 50.0),
                          TextButton
                          (
                            style: ButtonStyle(elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20.0)), backgroundColor: MaterialStateProperty.all(theme.blueColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: theme.bRadiusCTA))),
                            onPressed: _registerPressed,
                            child: Center(child: Text("M'inscrire", style: theme.textAuthButton)),
                          ),          
                          SizedBox(height: 60.0),
                          TextButton
                          (
                            style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(theme.accentColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: theme.bRadiusCTA))),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Center(child: Text("J'ai déjà un compte", style: theme.textStyleContent)),
                          ),  
                          SizedBox(height: 40.0),             
                        ],
                      )
                )
              ]),
            ),


              ],
            ),
          ),
        )));
  }
}
