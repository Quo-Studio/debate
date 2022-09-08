import 'package:debate/theme/theme.dart';
import 'package:flutter/material.dart';

profilePopUp(context, Map<String, dynamic> data) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                  child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: respWidth * 0.11,
                    child: Image.network(
                      data['profile_url'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: respWidth * 0.03,
                  ),
                  SizedBox(
                    child: Text(
                      data['name'] + " " + data['surname'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: respHeight * 0.03,
              ),
              const Text(
                'Inscrit depuis le 08/09/2022',
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: respHeight * 0.04,
              ),
              Container(
                height: 80,
                width: respWidth * 0.6,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(224, 235, 255, 100),
                          blurRadius: 4,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(189, 212, 255, 100)),
                child: Center(
                  child: Text(
                    data['karma'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: respHeight * 0.03,
              ),
              SizedBox(
                width: respWidth * 0.5,
                child: Text(
                  'Note de karma',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: respHeight * 0.03,
              ),
              Container(
                height: 80,
                width: respWidth * 0.6,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(215, 255, 223, 100),
                          blurRadius: 4,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(171, 244, 187, 100)),
                child: Center(
                  child: Text(
                    data['fiability'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: respHeight * 0.03,
              ),
              SizedBox(
                width: respWidth * 0.5,
                child: Text(
                  'Note de fiabilité',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: respHeight * 0.03,
              ),
              Container(
                height: 800,
                width: respWidth * 0.6,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(247, 229, 255, 100),
                          blurRadius: 4,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(236, 194, 255, 100)),
                child: Center(
                  child: Text(
                    data['activity'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: respHeight * 0.03,
              ),
              SizedBox(
                width: respWidth * 0.5,
                child: Text( 
                  'Note d\'activité',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ))));
}
