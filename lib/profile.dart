import 'package:debate/theme/theme.dart';
import 'package:flutter/material.dart';

profilePopUp(context) {
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
                    child: Image.asset(
                      'assets/profile.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: respWidth * 0.03,
                  ),
                  const SizedBox(
                    child: Text(
                      'Guirao Mathias',
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
                'Inscrit depuis le 07/03/2022',
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
                height: respHeight * 0.03,
              ),
              SizedBox(
                width: respWidth * 0.5,
                child: Text(
                  'Toujours positif avec les autres',
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
                height: respHeight * 0.03,
              ),
              SizedBox(
                width: respWidth * 0.5,
                child: Text(
                  'Toujours positif avec les autres',
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
                height: respHeight * 0.03,
              ),
              SizedBox(
                width: respWidth * 0.5,
                child: Text(
                  'Toujours positif avec les autres',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ))));
}
