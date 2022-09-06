import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 310,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  //LOGO
                  SizedBox(
                    height: 50.0,
                  ),
                  RichText(
                    text: TextSpan(
                  text: 'Bienvenue dans la\ncommunauté\nDebate',
                  style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 72, 72, 72), fontSize: 24, height: 1.4),
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
                        child: Text('Nom', style: TextStyle(color: Color.fromARGB(255, 72, 72, 72)))
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(decoration: InputDecoration(hintText: 'Nom', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 175, 175, 175)),
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
                      SizedBox(height: 20.0),
                      Center(
                        child: SizedBox(
                          width: 290,
                        child: Text('Prénom', style: TextStyle(color: Color.fromARGB(255, 72, 72, 72)))
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(decoration: InputDecoration(hintText: 'Prénom', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 175, 175, 175)),
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
                      SizedBox(height: 20.0),
                      Center(
                        child: SizedBox(
                          width: 290,
                        child: Text('Adresse E-Mail', style: TextStyle(color: Color.fromARGB(255, 72, 72, 72)))
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(decoration: InputDecoration(hintText: 'Adresse E-Mail', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 175, 175, 175)),
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
                      SizedBox(height: 20.0),
                      Center(
                        child: SizedBox(
                          width: 290,
                        child: Text('Mot de passe', style: TextStyle(color: Color.fromARGB(255, 72, 72, 72)))
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(decoration: InputDecoration(hintText: 'Mot de passe', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 175, 175, 175)),
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
                      SizedBox(height: 20.0),
                      Center(
                        child: SizedBox(
                          width: 290,
                        child: Text('Confirmer mot de passe', style: TextStyle(color: Color.fromARGB(255, 72, 72, 72)))
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(decoration: InputDecoration(hintText: 'Confirmer mot de passe', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 175, 175, 175)),
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
                      SizedBox(height: 20.0),
                    ],
                  )
                )
              ]),
            ),
          ),
        )));
  }
}


// import 'package:flutter/material.dart';
// import 'package:debate/screens/guest/Auth.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'test',
//       home: RegisterScreen(),
//     );
//   }
// }