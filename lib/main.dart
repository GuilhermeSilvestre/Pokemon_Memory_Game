import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/cards.dart';
import 'package:memory/control_cards.dart';
import 'cards.dart';
import 'control_cards.dart' as controlcards; // bugzinho, deixa isso aqui
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Memory Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ControlCardVisible cardVisible = ControlCardVisible();

  _MyHomePageState() {
    cardVisible.embaralha();
  }

  int aux = 0;
  String poke1 = '';
  int poke1Number = -1;
  String poke2 = '';
  int poke2Number = -1;

  void checkResult(int actualChoiceIndex, int numberChoices) {
    print('Aux: $aux');

    aux = aux + numberChoices;
    if (aux == 1) {
      poke1 = cardVisible.getPokemon(actualChoiceIndex);
      poke1Number = actualChoiceIndex;
      return;
    }
    if (aux == 2) {
      poke2 = cardVisible.getPokemon(actualChoiceIndex);
      poke2Number = actualChoiceIndex;
      return;
    }
    // até aqui ta boa essa funcao, agora pensar daqui pra baixo
    //em executar fora desse escopo depois da imagem ser montada na tela
    if (aux == 3) {
      if (poke1 == poke2) {
        print('Achou!');
        cardVisible.setVisibilityFalse(poke1Number);
        cardVisible.setVisibilityFalse(poke2Number);
      } else {
        click[poke1Number] = false;
        click[poke2Number] = false;
      }
      // nao deixando o terceiro aparecer:
      click[actualChoiceIndex] = false;
      poke1 = '';
      poke2 = '';
      poke1Number = -1;
      poke2Number = -1;
      aux = 0;
    }
  }

  List<bool> click = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void resetCardsBack() {
    int i = 0;
    for (i = 0; i < 16; i++) {
      click[i] = false;
    }
    aux = 0;
    poke1 = '';
    poke1Number = -1;
    poke2 = '';
    poke2Number = -1;
  }

  @override
  Widget build(BuildContext context) {
    print('---');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child: Text(
              'POKEMON MEMORY GAME',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if (cardVisible.getVisibility(0))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[0] = !click[0];
                                if (click[0] == true) {
                                  checkResult(0, 1);
                                }
                                print(cardVisible.getPokemon(0));
                                print(click[0]);
                              });
                            },
                            child: click[0]
                                ? card(cardVisible.getPokemon(0))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(1))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[1] = !click[1];
                                if (click[1] == true) {
                                  checkResult(1, 1);
                                }
                                print(cardVisible.getPokemon(1));
                                print(click[1]);
                              });
                            },
                            child: click[1]
                                ? card(cardVisible.getPokemon(1))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(2))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[2] = !click[2];
                                if (click[2] == true) {
                                  checkResult(2, 1);
                                }
                                print(cardVisible.getPokemon(2));
                                print(click[2]);
                              });
                            },
                            child: click[2]
                                ? card(cardVisible.getPokemon(2))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(3))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[3] = !click[3];
                                if (click[3] == true) {
                                  checkResult(3, 1);
                                }
                                print(cardVisible.getPokemon(3));
                                print(click[3]);
                              });
                            },
                            child: click[3]
                                ? card(cardVisible.getPokemon(3))
                                : card(),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      if (cardVisible.getVisibility(4))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[4] = !click[4];
                                if (click[4] == true) {
                                  checkResult(4, 1);
                                }
                                print(cardVisible.getPokemon(4));
                                print(click[4]);
                              });
                            },
                            child: click[4]
                                ? card(cardVisible.getPokemon(4))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(5))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[5] = !click[5];
                                if (click[5] == true) {
                                  checkResult(5, 1);
                                }
                                print(cardVisible.getPokemon(5));
                                print(click[5]);
                              });
                            },
                            child: click[5]
                                ? card(cardVisible.getPokemon(5))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(6))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[6] = !click[6];
                                if (click[6] == true) {
                                  checkResult(6, 1);
                                }
                                print(cardVisible.getPokemon(6));
                                print(click[6]);
                              });
                            },
                            child: click[6]
                                ? card(cardVisible.getPokemon(6))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(7))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[7] = !click[7];
                                if (click[7] == true) {
                                  checkResult(7, 1);
                                }
                                print(cardVisible.getPokemon(7));
                                print(click[7]);
                              });
                            },
                            child: click[7]
                                ? card(cardVisible.getPokemon(7))
                                : card(),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      if (cardVisible.getVisibility(8))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[8] = !click[8];
                                if (click[8] == true) {
                                  checkResult(8, 1);
                                }
                                print(cardVisible.getPokemon(8));
                                print(click[8]);
                              });
                            },
                            child: click[8]
                                ? card(cardVisible.getPokemon(8))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(9))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[9] = !click[9];
                                if (click[9] == true) {
                                  checkResult(9, 1);
                                }
                                print(cardVisible.getPokemon(9));
                                print(click[9]);
                              });
                            },
                            child: click[9]
                                ? card(cardVisible.getPokemon(9))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(10))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[10] = !click[10];
                                if (click[10] == true) {
                                  checkResult(10, 1);
                                }
                                print(cardVisible.getPokemon(10));
                                print(click[10]);
                              });
                            },
                            child: click[10]
                                ? card(cardVisible.getPokemon(10))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(11))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[11] = !click[11];
                                if (click[11] == true) {
                                  checkResult(11, 1);
                                }
                                print(cardVisible.getPokemon(11));
                                print(click[11]);
                              });
                            },
                            child: click[11]
                                ? card(cardVisible.getPokemon(11))
                                : card(),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      if (cardVisible.getVisibility(12))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[12] = !click[12];
                                if (click[12] == true) {
                                  checkResult(12, 1);
                                }
                                print(cardVisible.getPokemon(12));
                                print(click[12]);
                              });
                            },
                            child: click[12]
                                ? card(cardVisible.getPokemon(12))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(13))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[13] = !click[13];
                                if (click[13] == true) {
                                  checkResult(13, 1);
                                }
                                print(cardVisible.getPokemon(13));
                                print(click[13]);
                              });
                            },
                            child: click[13]
                                ? card(cardVisible.getPokemon(13))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(14))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[14] = !click[14];
                                if (click[14] == true) {
                                  checkResult(14, 1);
                                }
                                print(cardVisible.getPokemon(14));
                                print(click[14]);
                              });
                            },
                            child: click[14]
                                ? card(cardVisible.getPokemon(14))
                                : card(),
                          ),
                        ),
                      if (cardVisible.getVisibility(15))
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click[15] = !click[15];
                                if (click[15] == true) {
                                  checkResult(15, 1);
                                }
                                print(cardVisible.getPokemon(15));
                                print(click[15]);
                              });
                            },
                            child: click[15]
                                ? card(cardVisible.getPokemon(15))
                                : card(),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                cardVisible.embaralha();
                resetCardsBack();
                print(cardVisible.pokemonList[0]);
              });
            },
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Text(
                'RESTART GAME',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
