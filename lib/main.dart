import 'package:debate/news/news.dart';
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

  final db = FirebaseFirestore.instance;

  news = NewsController();

  DocumentReference docRef = db.collection('News').doc('Dg7DrZeQTs3la6QPxpNL');

  await docRef.get()
  .then((value) async {
    Map data = {};
    data = value.data() as Map<String, dynamic>;
    news.setData(data, docRef);
  });

  await news.getJudgements();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,systemNavigationBarColor: theme.backgroundColor));
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
    return MaterialApp
    (
       debugShowCheckedModeBanner: false,
        title: 'Debate',
        theme: ThemeData
        (
          scaffoldBackgroundColor: theme.backgroundColor
        ),
        home: News(),
    );
  }
}
