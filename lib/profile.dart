import 'package:flutter/material.dart';


profilePopUp(context) {
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
}
