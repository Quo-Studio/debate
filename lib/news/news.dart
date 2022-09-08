import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate/news/commentPop.dart';
import 'package:debate/news/updownvotePop.dart';
import 'package:debate/profile.dart';
import 'package:debate/script/accountController.dart';
import 'package:debate/script/newsController.dart';
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

    double total = 0;

    int down = news.data['downvotes'];
    int up = news.data['upvotes'];
    if (up != 0)
    {
      total = down/up;
    }

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
                  child: Image.network(news.data['url_image'], fit: BoxFit.fill),
                ),
                const SizedBox(height: 30),
                Text(news.data['title'], style: theme.textNewsTitle),
                const SizedBox(height: 30),
                SizedBox
                (
                  child: Text(news.data['content'], style: theme.textNewsContent,),
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
      bottomNavigationBar: BottomAppBar
      (
        elevation: 0,
        color: Colors.transparent,
          child: Row( mainAxisAlignment: MainAxisAlignment.center,children :[Padding(padding: EdgeInsets.only(bottom: 10), child: theme.JudgeButton
          (
            onPressed: () {
              judgePopUp(context);
            },
          )) ]),
      ),
    );
  }
}


 List<Widget> _getJudgements() {
  List<Widget> list = [];

  for (var j in news.judgements)
  {
    list.add(JudgementCard(data: j));
    list.add(const SizedBox(height: 40));
  }

  return list;
}

class JudgementCard extends StatefulWidget {
  JudgementCard({super.key,  required this.data});

  final Map data;
  Map author_data = {
    'name' : "Prénom",
    'surname' : "Nom",
  };

  @override
  State<JudgementCard> createState() => _JudgementCardState();
}

class _JudgementCardState extends State<JudgementCard> {

  @override
  void initState() {
    
    super.initState();
  }

  viewComments() async {

    List<Map> commentsData = await news.getComments(widget.data['ref']);
    List<Widget> cards = getCommentsCards(commentsData);
    showDialog<void>
    (
      context: context,
      builder: (BuildContext context) {
        TextEditingController commentController = TextEditingController();
        return AlertDialog(
          title: Center(child: Text('Commentaires')),
          content: SizedBox
          (
            width: theme.respWidth * 0.9,
            height: theme.respHeight * 0.85,
            child: SingleChildScrollView
            (
              child: Column
              (
                children: cards
              ),
            ),
          ),
          actions: 
          [
            Column
            (
              children: 
              [
                TextFormField
                (
                  controller: commentController,
                  maxLines: 4,
                  decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Mon comm..', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),borderRadius: BorderRadius.circular(6.0),))
                ),
                const SizedBox(height: 8),
                theme.CtaButtonLogin(content: "Envoyer", onPressed: () async {
                  Map<String, dynamic> dataToSet = {
                    'author_id' : account.user.email,
                    'content' : commentController.text,
                    'date' : Timestamp.now().millisecondsSinceEpoch
                  };
                  DocumentReference ref = widget.data['ref'] as DocumentReference;
                  await ref.collection('Comments').add(dataToSet)
                  .then((value) {
                    Navigator.pop(context);
                  });
                },),
                const SizedBox(height: 15),

              ],
            )
          ],
        );
      }
    );
  }

  List<Widget> getCommentsCards(List<Map> commentsData) {
    List<Widget> list = [];

    for (var doc in commentsData)
    {
      list.add(CommentCard(data: doc));
      list.add(const SizedBox(height: 18,));
      list.add(Center(child:Container(color: Colors.grey, width: theme.respWidth * 0.7, height: 1)));
      list.add(const SizedBox(height: 18));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {

    news.getUserFromID(widget.data['author_id']).then((value) {
      setState(() {
        widget.author_data = value;
      });
    });

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
                          SizedBox(width: 30, height: 30, child: Image.network(widget.author_data['profile_url'], fit: BoxFit.fill)),
                          const SizedBox(width: 12,),
                          GestureDetector
                          (
                            onTap: () {profilePopUp(context, widget.author_data as Map<String, dynamic>);},
                            child: Text(widget.author_data['surname'] + " " + widget.author_data['name'], style: theme.textCommentProfile,),
                          )
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
                              IconButton(onPressed: voteYesPopUp(context, true, widget.data as Map<String, dynamic>, widget.author_data as Map<String, dynamic> ), icon: Icon(Icons.arrow_upward, size: 20,)),
                              Text((widget.data['upvotes'] - widget.data['downvotes']).toString(), style: theme.textNewsTitle),
                              IconButton(onPressed: voteYesPopUp(context, false , widget.data as Map<String, dynamic>, widget.author_data as Map<String, dynamic> ), icon: Icon(Icons.arrow_downward, size: 20,)),
                            ],
                          )
                          ),
                          const SizedBox(width: 10),
                          Container
                          (
                            width: theme.respWidth * 0.60,
                            decoration: BoxDecoration(borderRadius: theme.bRadiusCTA, color: Colors.white, boxShadow: [BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4)]),
                            child: Padding(padding: EdgeInsets.all(17.0),child: Text(widget.data['content'], style: theme.textJudgementContent)),
                          )
                        ],
                      ),
                      Center(child: TextButton( onPressed: viewComments, child: Text("Voir les commentaires", style: theme.textNewsContent)))
                    ],
                  ),
                );
  }
}

class CommentCard extends StatefulWidget {
  CommentCard({super.key, required this.data});

  final Map data;
  Map author_data = {
    'name' : "Prénom",
    'surname' : "Nom",
  };

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {

  @override
  void initState() {
    news.getUserFromID(widget.data['author_id']).then((value) {
      setState(() {
        widget.author_data = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        Row
        (
          children: 
          [
            const SizedBox(width: 12,),
            SizedBox(width: 30, height: 30, child: Image.network(widget.author_data['profile_url'], fit: BoxFit.fill)),
            const SizedBox(width: 12,),
            GestureDetector
            (
              onTap: () {profilePopUp(context, widget.author_data as Map<String, dynamic>);},
              child: Text(widget.author_data['surname'] + " " + widget.author_data['name'], style: theme.textCommentProfile,),
            )
            
          ],
        ),
        const SizedBox(height: 12),
        Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10) ,child: Text(widget.data['content'], style: theme.textJudgementContent,))
      ],
    );
  }
}