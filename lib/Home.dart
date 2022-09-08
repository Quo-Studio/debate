import 'package:debate/news/news.dart';
import 'package:debate/profile.dart';
import 'package:debate/script/accountController.dart';
import 'package:debate/script/newsController.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    theme.respWidth = MediaQuery.of(context).size.width;
    theme.respHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
        body: SingleChildScrollView(
          child: SizedBox(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 40),
                  child: Text(
                    "Mes news aujourd'hui",
                    style: theme.textNewsTitle,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: modulesGrid()
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
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
    return GestureDetector(
      onTap: () async {
        news.setData(widget.data, widget.data['ref']);
        await news.getJudgements();
        Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
      },
      child: Container(
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
        width: theme.respWidth * 0.8 * 0.485,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: theme.respWidth * 0.8 * 0.485 * 0.9,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(widget.data['url_image'], fit: BoxFit.fill),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: theme.respWidth * 0.8 * 0.485 * 0.9,
              height: 100,
              child: Text(
                widget.data['title'],
                style: theme.textCard,
                maxLines: 4,

                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
        ));
  }
}

Widget modulesGrid() {
  List<Widget> modules = [];

  for (var doc in account.newsList) {
    modules.add(Card(data: doc));
  }

  print(modules);

  Widget grid = SizedBox(
    width: theme.respWidth * 0.8,
    child: Wrap(
      spacing: theme.respWidth * 0.8 * 0.03,
      runSpacing: theme.respWidth * 0.8 * 0.03,
      children: modules,
    ),
  );
  return grid;
}
