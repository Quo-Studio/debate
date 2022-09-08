import 'package:debate/script/newsController.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;

voteYesPopUp(context, bool isUp) {
  TextEditingController commentController = TextEditingController();
  bool agree = true;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: 
          [
            Center(child: Text("Mon jugement", style: theme.textNewsTitle)),
            const SizedBox(height: 45),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
              [
                theme.YesButton(onPressed: () {
                  agree = true;
                }),
                theme.NoButton(onPressed: () {
                  agree = false;
                }),
              ],
            ),
            const SizedBox(height: 30),
            TextFormField
            (
              controller: commentController,
              maxLines: 6,
              decoration: InputDecoration(filled: true, fillColor: Color.fromARGB(255, 255, 255, 255), hintText: 'Mon comm..', hintStyle: TextStyle(color: Color.fromARGB(133, 72, 72, 72)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 218, 218, 218)),borderRadius: BorderRadius.circular(6.0),))
            ),
            const SizedBox(height: 30),
            theme.CtaButtonLogin(
              content: "Confirmer",
              onPressed: () async {
                Map<String, dynamic> data = {
                  'upvotes' : news.data['upvotes'],
                  'downvotes' : news.data['downvotes']
                };
                if (agree) {
                  data['upvotes'] = news.data['upvotes'] + 1;
                }
                else
                {
                  data['downvotes'] = news.data['downvotes'] + 1;
                }
                await news.addJudgement(data, commentController.text)
                .then((value) => Navigator.pop(context));
              }
            ),
            const SizedBox(height: 25),
          ],
        )
      )
    )
  );
}
 