import 'package:debate/Home.dart';
import 'package:debate/main.dart';
import 'package:debate/screens/guest/inscription.dart';
import 'package:debate/script/accountController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _loginPressed() async  {
    if (mailController.text != "" && passwordController.text != "")
    {
      String resultCode = await account.logInAuth(mailController.text, passwordController.text);

    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
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
                      text: 'Hey,\nContent\nde vous revoir !',
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
                          SizedBox(height: 50.0),
                          TextButton
                          (
                            style: ButtonStyle(elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20.0)), backgroundColor: MaterialStateProperty.all(theme.blueColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: theme.bRadiusCTA))),
                            onPressed: _loginPressed,
                            child: Center(child: Text("M'inscrire", style: theme.textAuthButton)),
                          ),          
                          SizedBox(height: 80.0),
                          TextButton
                          (
                            style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(theme.accentColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: theme.bRadiusCTA))),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                            },
                            child: Center(child: Text("Je désire m'inscrire", style: theme.textStyleContent)),
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