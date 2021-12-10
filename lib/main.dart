import 'package:flutter/material.dart';
import 'package:vki_hesaplama/card_widget.dart';
import 'package:vki_hesaplama/sabitler.dart';
import 'package:vki_hesaplama/sonuc_sayfasi.dart';

void main() {
  runApp(const MyApp());
}

enum cinsiyet { male, female, notrs }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter İlk Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color cardColor = rkPasifCardBackColor;
  cinsiyet seciliCinsiyet;
  int height = 180;
  int weight = 60;
  int age = 35;
  double vki = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rkZeminArkaPlan,
      appBar: AppBar(
        backgroundColor: rkZeminArkaPlan,
        title: Center(
          child: Text(
            "VKİ Hesaplama",
            style: TextStyle(
              color: rkCardForeColor,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GuzelCard(
                      fonksiyon: () {
                        setState(() {
                          seciliCinsiyet = cinsiyet.male;
                        });
                      },
                      cardColor: seciliCinsiyet == cinsiyet.male
                          ? rkAktifCardBackColor
                          : rkPasifCardBackColor,
                      simge: Icons.male,
                      metin: "ERKEK",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GuzelCard(
                      fonksiyon: () {
                        setState(() {
                          seciliCinsiyet = cinsiyet.female;
                        });
                      },
                      cardColor: seciliCinsiyet == cinsiyet.female
                          ? rkAktifCardBackColor
                          : rkPasifCardBackColor,
                      simge: Icons.female,
                      metin: "KADIN",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: OrtakCard(
                fonksiyon: () {},
                cardColor: rkPasifCardBackColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: tsActivCardColor,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: tsHeightStyle,
                        ),
                        Text(
                          "cm",
                          style: tsCmStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: stSliderTheme,
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: OrtakCard(
                  fonksiyon: () {},
                  cardColor: rkPasifCardBackColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: tsActivCardColor,
                      ),
                      Text(
                        weight.toString(),
                        style: tsHeightStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: rkAktifCardBackColor,
                              shape: CircleBorder(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(
                              Icons.remove_outlined,
                              size: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: rkAktifCardBackColor,
                              shape: CircleBorder(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: OrtakCard(
                  fonksiyon: () {},
                  cardColor: rkPasifCardBackColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: tsActivCardColor,
                      ),
                      Text(
                        age.toString(),
                        style: tsHeightStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: rkAktifCardBackColor,
                              shape: CircleBorder(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(
                              Icons.remove_outlined,
                              size: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: rkAktifCardBackColor,
                              shape: CircleBorder(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    vki = weight / ((height / 100) * (height / 100));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucSayfasi(
                                  height: height,
                                  weight: weight,
                                  vki: vki,
                                )));
                  },
                  child: Text(
                    "HESAPLA",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
