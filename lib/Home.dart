import 'package:debate/profile.dart';
import 'package:debate/script/accountController.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;


class Home extends StatelessWidget {
  const Home({super.key});

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const example()));
  }

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
            onPressed: () => _navigateToNextScreen(context),
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
            Center(
              child: ElevatedButton(
                child: const Text('Test'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              content: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/profile.png'),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    child: Text(
                                      'Guirao Mathias',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    child: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Inscrit depuis le 07/03/2022',
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 105,
                              ),
                              Container(
                                height: 70,
                                width: 240,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              224, 235, 255, 100),
                                          blurRadius: 4,
                                          offset: Offset(0, 4))
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        189, 212, 255, 100)),
                                child: const Center(
                                  child: Text(
                                    '335',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Toujours positif avec les autres',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 70,
                                width: 240,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              215, 255, 223, 100),
                                          blurRadius: 4,
                                          offset: Offset(0, 4))
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        171, 244, 187, 100)),
                                child: const Center(
                                  child: Text(
                                    '666',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Toujours positif avec les autres',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 70,
                                width: 240,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              247, 229, 255, 100),
                                          blurRadius: 4,
                                          offset: Offset(0, 4))
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        236, 194, 255, 100)),
                                child: const Center(
                                  child: Text(
                                    '543',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Toujours positif avec les autres',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )));
                },
              ),
            ),
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