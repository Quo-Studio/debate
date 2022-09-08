import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate/script/accountController.dart';
import 'package:flutter/material.dart';

class NewsController {

  Map data = {};
  late DocumentReference newsRef;
  late DocumentReference judgRef;
  List<Map> judgements = [];

  setData(Map currentData, DocumentReference ref) async {
    data = currentData;
    newsRef = ref;
    print(data);
  }
  
  getJudgements() async {

    await newsRef.collection("Judgement").get()
    .then((value) {
      for (var doc in value.docs)
      {
        DocumentReference ref = newsRef.collection('Judgement').doc(doc.id);
        final iter = <String, dynamic>{'ref' : ref};
        Map<String, dynamic> data = {};
        data = doc.data();
        data.addEntries(iter.entries);
        judgements.add(data);
      }
    });
  }

  Future<List<Map>> getComments(DocumentReference ref) async {

    List<Map> data = [];
    await ref.collection("Comments").get()
    .then((value) {
      for (var doc in value.docs)
      {
        data.add(doc.data());
      }
    });
    return data;
  }

  Future<Map> getUserFromID(String id) async
  {
    Map data = {};
    final db = FirebaseFirestore.instance;

    await db.collection("User").doc(id).get()
    .then((value) {
      data = value.data()!;
    });
    return data;
  }

   Future addJudgement(Map<String, dynamic> data, String content) async {

    // modifier le doc
    // ajouter un judgement à la collection
    Map<String, dynamic> judgementData = {
      'author_id' : account.user.email,
      'content' : content,
      'downvotes' : 0,
      'upvotes' : 0,
      'votesTypes' : {'karma' : 0, 'fiability' : 0}
    };

    await newsRef.set(data, SetOptions(merge: true))
    .then((value)  async {
      await newsRef.collection('Judgement').add(judgementData);
    });
    
  }
  
}

late NewsController news;