import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {

    theme.respWidth = MediaQuery.of(context).size.width;
    theme.respHeight = MediaQuery.of(context).size.height;

    int down = 300;
    int up = 650;
    double total = down/up;

    return Scaffold
    (
      body: SingleChildScrollView
      (
        child: Center
        (
          child: SizedBox
          (
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                const SizedBox(height: 50),
                theme.CtaButton(content: "Revenir en arrière"),
                const SizedBox(height: 40),
                SizedBox
                (
                  height: 165,
                  child: Image.asset('assets/news_placeholder.png', fit: BoxFit.fill),
                ),
                const SizedBox(height: 30),
                Text("Climat, une menace plane sur l’étang de Tau", style: theme.textNewsTitle),
                const SizedBox(height: 30),
                SizedBox
                (
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ", style: theme.textNewsContent,),
                ),
                const SizedBox(height: 50),
                theme.voteBar(up, down),
                const SizedBox(height: 12),
                Text((total*100).round().toString() + " % des personnes estiment cette information fausse", style: theme.textTotal,),
                const SizedBox(height: 30),
                Center
                (
                  child:Text("Jugements", style: theme.textNewsTitle)
                ),
                const SizedBox(height: 30),
                Column
                (
                  children: _getJudgements(),
                )
                

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 List<Widget> _getJudgements() {
  List<Widget> list = [];
  list.add(JudgementCard(data: {}));
  list.add(const SizedBox(height: 40));
  return list;
}

class JudgementCard extends StatefulWidget {
  const JudgementCard({super.key,  required this.data});

  final Map data;

  @override
  State<JudgementCard> createState() => _JudgementCardState();
}

class _JudgementCardState extends State<JudgementCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox
                (
                  width: theme.respWidth * 0.8,
                  child: Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                      Row
                      (
                        children: 
                        [
                          const SizedBox(width: 12,),
                          SizedBox(width: 30, height: 30, child: Image.asset('assets/pp_placeholder.png', fit: BoxFit.fill)),
                          const SizedBox(width: 12,),
                          Text("Nom Prénom", style: theme.textCommentProfile,)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row
                      (
                        children: 
                        [
                          Container(
                            child : Column
                          (
                            children: 
                            [
                              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_upward, size: 20,)),
                              Text("56", style: theme.textNewsTitle),
                              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_downward, size: 20,)),
                            ],
                          )
                          ),
                          const SizedBox(width: 10),
                          Container
                          (
                            width: theme.respWidth * 0.60,
                            decoration: BoxDecoration(borderRadius: theme.bRadiusCTA, color: Colors.white, boxShadow: [BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4)]),
                            child: Padding(padding: EdgeInsets.all(17.0),child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been", style: theme.textJudgementContent)),
                          )
                        ],
                      ),
                      Center(child: Text("Voir les commentaires", style: theme.textNewsContent))
                    ],
                  ),
                );
  }
}