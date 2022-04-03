// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';

import './constants.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';

// ignore: use_key_in_widget_constructors
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double sigaraSayisi = 30.0;
  double sporSayisi = 3.0;
  int boy = 170;
  int kilo = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: outlinedButtons("BOY"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: outlinedButtons("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haftada Kaç Gün Spor Yapıyorsun?",
                      style: kMetinStili,
                    ),
                    Text(
                      sporSayisi.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider(
                        divisions: 7,
                        min: 0,
                        max: 7,
                        value: sporSayisi,
                        onChanged: (double new2Value) {
                          setState(() {
                            sporSayisi = new2Value;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Günde Kaç Sigara İçiyorsun?",
                      style: kMetinStili,
                    ),
                    Text(
                      sigaraSayisi.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider(
                        divisions: 60,
                        min: 0,
                        max: 60,
                        value: sigaraSayisi,
                        onChanged: (double newValue) {
                          setState(() {
                            sigaraSayisi = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                        onPress: () {
                          setState(() {
                            seciliCinsiyet = "Kadın";
                          });
                        },
                        renk: seciliCinsiyet == "Kadın"
                            ? Colors.blueAccent[100]
                            : Colors.white,
                        child: IconCinsiyet(
                          cinsiyet: "Kadın",
                          icon: FontAwesomeIcons.venus,
                        )),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "Erkek";
                        });
                      },
                      renk: seciliCinsiyet == "Erkek"
                          ? Colors.blueAccent[100]
                          : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: "Erkek",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => resultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              sigaraSayisi: sigaraSayisi,
                              sporSayisi: sporSayisi))));
                },
                child: Text(
                  "HESAPLA",
                  style: kMetinStili,
                )),
          ],
        ),
      ),
    );
  }

  Row outlinedButtons(
    String label,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label,
              style: kMetinStili,
            )),
        SizedBox(width: 10),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label == "BOY" ? boy.toString() : kilo.toString(),
              style: kSayiStili,
            )),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueAccent)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy-- : kilo--;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  color: Colors.black,
                  size: 15,
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueAccent)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
