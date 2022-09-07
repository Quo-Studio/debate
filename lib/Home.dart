import 'package:debate/profile.dart';
import 'package:debate/script/accountController.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/img_icon.png',
              fit: BoxFit.contain,
              height: 32,
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(IconData(0xee35, fontFamily: 'MaterialIcons')),
            color: Colors.black,
            iconSize: 38,
          )
        ],
      ),
      body: SingleChildScrollView
      (
        child: SizedBox
        (
          width: theme.respWidth * 0.8,
        
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 40, left: 24),
              child: const Text(
                "Mes news aujourd'hui",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            modulesGrid(),
           
          ],
        ),
      ),
      )
    );
  }
}


class Card extends StatefulWidget {
  const Card({super.key, required this.data});

  final Map data;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 220,
        width: 170,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 140,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.asset('assets/paysage.jpg', fit: BoxFit.fill),
                )),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 130,
              child: Text(
                'Climat, une menace pour la planète',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            )
          ],
        ));
  }
}



Widget modulesGrid() {
  List<Widget> modules = [];

  for (var doc in account.newsList)
  {
    modules.add(Card(data:doc));
  }

    print(modules);

  Widget grid = SizedBox
  (
    width: theme.respWidth * 0.8,
    child: Wrap
    (
      spacing: theme.respWidth * 0.8 * 0.04,
      runSpacing: theme.respWidth * 0.8 * 0.04,
      children: modules,
    ),
  );
  return grid;
}