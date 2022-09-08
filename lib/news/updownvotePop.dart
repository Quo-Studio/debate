import 'package:debate/script/newsController.dart';
import 'package:flutter/material.dart';
import 'package:debate/theme/theme.dart' as theme;

voteYesPopUp(context, bool isUp, Map<String, dynamic> judgementData, Map<String, dynamic> authorData) {
  Map<String, dynamic> types_Voted = judgementData['votes_types'];
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: 
          [
            Center(child: Text("Pourquoi \"upvote\" ce jugement ?", style: theme.textNewsTitle)),
            const SizedBox(height: 45),
            Column
            (
              children: 
              [
                
              ],
            ),
            const SizedBox(height: 30),
            theme.CtaButtonLogin(
              content: "Confirmer",
              onPressed: () async {
                Map<String, dynamic> types = judgementData['votes_types'];
                types.forEach((key, value) {
                  types[key] = types[key] + types_Voted[key];
                });
                Map<String, dynamic> dataToSet = {
                  'upvotes' : judgementData['upvotes'] + 1,
                  'votes_types' : types,
                };

                await news.addVote(dataToSet, judgementData['author_id'], types_Voted).then((value) => Navigator.pop(context));
                // Ajouter des points au user en question
              }
            ),
            const SizedBox(height: 25),
          ],
        )
      )
    )
  );
}
 