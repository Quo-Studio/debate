import 'package:debate/Home.dart';
import 'package:debate/news/news.dart';
import 'package:debate/screens/guest/login.dart';
import 'package:debate/script/accountController.dart';
import 'package:debate/script/newsController.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:debate/theme/theme.dart' as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  account = AccountController();
  if (await account.init()) {}

  final db = FirebaseFirestore.instance;

  news = NewsController();

  await db.collection("News").get().then((value) {
    for (var doc in value.docs) {
      account.newsList.add(doc.data());
    }
  });

  DocumentReference docRef = db.collection('News').doc('Dg7DrZeQTs3la6QPxpNL');

  await docRef.get().then((value) async {
    Map data = {};
    data = value.data() as Map<String, dynamic>;
    news.setData(data, docRef);
  });

  await news.getJudgements();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: theme.backgroundColor));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Main());
  });
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    if (account.isConnected) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LifeHome Connect',
        theme: ThemeData(scaffoldBackgroundColor: theme.backgroundColor),
        home: Builder(
          builder: ((context) {
            return MediaQuery(
              child: const News(),
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          }),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LifeHome Connect',
        theme: ThemeData(scaffoldBackgroundColor: theme.backgroundColor),
        home: Builder(
          builder: ((context) {
            return MediaQuery(
              child: const LoginScreen(),
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          }),
        ),
      );
    }
  }
}
