import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/aksiyonkategorisayfasi.dart';
import 'package:moviehub/animasyonkategorisayfasi.dart';
import 'package:moviehub/filmekle.dart';
import 'package:moviehub/filmsayfasi.dart';
import 'package:moviehub/girisyap.dart';
import 'package:moviehub/hepsi.dart';
import 'package:moviehub/romantikkategorisayfasi.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

Color renk1 = Color.fromARGB(255, 15, 15, 15);
Color renk2 = Color.fromARGB(255, 15, 15, 15);
Color renk3 = Color.fromARGB(255, 15, 15, 15);
Color renk4 = Color.fromARGB(255, 15, 15, 15);

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> film1 = [];
    List<dynamic> film2 = [];
    List<dynamic> film3 = [];
    List<dynamic> film4 = [];
    List<dynamic> film5 = [];
    List<dynamic> film6 = [];

    final db = FirebaseFirestore.instance;

    CollectionReference filmlerRef = db.collection("Filmler");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MovieHub",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    InkWell(
                      onTap: () async {
                        final _firebaseAuth = await FirebaseAuth.instance;
                        await _firebaseAuth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => girisyap(),
                          ),
                        );
                      },
                      child: Icon(Icons.logout, size: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "Kategoriler",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            renk1 = Color.fromARGB(240, 214, 168, 29);
                            renk2 = Color.fromARGB(255, 15, 15, 15);
                            renk3 = Color.fromARGB(255, 15, 15, 15);
                            renk4 = Color.fromARGB(255, 15, 15, 15);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => hepsisayfasi(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: renk1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Hepsi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            renk2 = Color.fromARGB(240, 214, 168, 29);
                            renk1 = Color.fromARGB(255, 15, 15, 15);
                            renk3 = Color.fromARGB(255, 15, 15, 15);
                            renk4 = Color.fromARGB(255, 15, 15, 15);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => aksiyonkategorisayfasi(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: renk2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Aksiyon",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            renk3 = Color.fromARGB(240, 214, 168, 29);
                            renk2 = Color.fromARGB(255, 15, 15, 15);
                            renk1 = Color.fromARGB(255, 15, 15, 15);
                            renk4 = Color.fromARGB(255, 15, 15, 15);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    animasyonkategorisayfasi(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: renk3,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Animasyon",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            renk4 = Color.fromARGB(240, 214, 168, 29);
                            renk1 = Color.fromARGB(255, 15, 15, 15);
                            renk2 = Color.fromARGB(255, 15, 15, 15);
                            renk3 = Color.fromARGB(255, 15, 15, 15);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => romantikkategorisayfasi(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: renk4,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Romantik",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<QuerySnapshot>(
                          future: filmlerRef
                              .where("adi", isEqualTo: "Black Widow")
                              .get(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              var query = snapshot.data;
                              query!.docs.forEach((doc) async {
                                var veri =
                                    await doc.data() as Map<dynamic, dynamic>;
                                film1.add(veri);
                              });
                            }
                            return InkWell(
                              onTap: () async {
                                String adi = film1[0]["adi"];
                                String yonetmen = film1[0]["Yönetmen"];
                                String anaResim = film1[0]["anaResim"];
                                String logo = film1[0]["logo"];
                                String tur = film1[0]["tur"];
                                String yil = film1[0]["yil"];
                                String yildiz = film1[0]["yildiz"];
                                String saat = film1[0]["saat"];
                                String aciklama = film1[0]["aciklama"];
                                String yukleyen = film1[0]["yukleyen"];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => filmsayfasi(
                                          adi,
                                          anaResim,
                                          logo,
                                          saat,
                                          tur,
                                          yil,
                                          yildiz,
                                          yonetmen,
                                          aciklama,
                                          yukleyen)),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/blackwidowLogo.png",
                                          // "${film1[0]["logo"]}",
                                          width: 130,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Black Widow",
                                          //"${film1[0]["adi"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      FutureBuilder<QuerySnapshot>(
                          future: filmlerRef
                              .where("adi", isEqualTo: "Yukarı Bak")
                              .get(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              var query = snapshot.data;
                              query!.docs.forEach((doc) async {
                                var veri =
                                    await doc.data() as Map<dynamic, dynamic>;
                                film2.add(veri);
                              });
                            }
                            return InkWell(
                              onTap: () {
                                String adi = film2[0]["adi"];
                                String yonetmen = film2[0]["Yönetmen"];
                                String anaResim = film2[0]["anaResim"];
                                String logo = film2[0]["logo"];
                                String tur = film2[0]["tur"];
                                String yil = film2[0]["yil"];
                                String yildiz = film2[0]["yildiz"];
                                String saat = film2[0]["saat"];
                                String aciklama = film2[0]["aciklama"];
                                String yukleyen = film2[0]["yukleyen"];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => filmsayfasi(
                                          adi,
                                          anaResim,
                                          logo,
                                          saat,
                                          tur,
                                          yil,
                                          yildiz,
                                          yonetmen,
                                          aciklama,
                                          yukleyen)),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/yukaribaklogo.jpg",
                                          //"${film2[0]["logo"]}",
                                          width: 130,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Yukarı Bak",
                                          // "${film2[0]["adi"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      FutureBuilder<QuerySnapshot>(
                          future: filmlerRef
                              .where("adi", isEqualTo: "Five Feet Apart")
                              .get(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              var query = snapshot.data;
                              query!.docs.forEach((doc) async {
                                var veri =
                                    await doc.data() as Map<dynamic, dynamic>;
                                film3.add(veri);
                              });
                            }
                            return InkWell(
                              onTap: () {
                                String adi = film3[0]["adi"];
                                String yonetmen = film3[0]["Yönetmen"];
                                String anaResim = film3[0]["anaResim"];
                                String logo = film3[0]["logo"];
                                String tur = film3[0]["tur"];
                                String yil = film3[0]["yil"];
                                String yildiz = film3[0]["yildiz"];
                                String saat = film3[0]["saat"];
                                String aciklama = film3[0]["aciklama"];
                                String yukleyen = film3[0]["yukleyen"];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => filmsayfasi(
                                          adi,
                                          anaResim,
                                          logo,
                                          saat,
                                          tur,
                                          yil,
                                          yildiz,
                                          yonetmen,
                                          aciklama,
                                          yukleyen)),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/fivefeetLogo.png",
                                          width: 130,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Five Feet Apart",
                                          //"${film3[0]["adi"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      FutureBuilder<QuerySnapshot>(
                          future: filmlerRef
                              .where("adi", isEqualTo: "Venom: Zehirli Öfke 2")
                              .get(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              var query = snapshot.data;
                              query!.docs.forEach((doc) async {
                                var veri =
                                    await doc.data() as Map<dynamic, dynamic>;
                                film4.add(veri);
                              });
                            }
                            return InkWell(
                              onTap: () {
                                String adi = film4[0]["adi"];
                                String yonetmen = film4[0]["Yönetmen"];
                                String anaResim = film4[0]["anaResim"];
                                String logo = film4[0]["logo"];
                                String tur = film4[0]["tur"];
                                String yil = film4[0]["yil"];
                                String yildiz = film4[0]["yildiz"];
                                String saat = film4[0]["saat"];
                                String aciklama = film4[0]["aciklama"];
                                String yukleyen = film4[0]["yukleyen"];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => filmsayfasi(
                                          adi,
                                          anaResim,
                                          logo,
                                          saat,
                                          tur,
                                          yil,
                                          yildiz,
                                          yonetmen,
                                          aciklama,
                                          yukleyen)),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/venomLogo.jpg",
                                          //"${film4[0]["logo"]}",
                                          width: 130,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Venom: Zehirli Öfke 2",
                                          //"${film4[0]["adi"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Önerilenler",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => hepsisayfasi()));
                      },
                      child: Text(
                        "daha fazla",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FutureBuilder<QuerySnapshot>(
                      future: filmlerRef
                          .where("adi", isEqualTo: "John Wick: 3 ")
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var query = snapshot.data;
                          query!.docs.forEach((doc) async {
                            var veri =
                                await doc.data() as Map<dynamic, dynamic>;
                            film5.add(veri);
                          });
                        }
                        return InkWell(
                          onTap: () {
                            String adi = film5[0]["adi"];
                            String yonetmen = film5[0]["Yönetmen"];
                            String anaResim = film5[0]["anaResim"];
                            String logo = film5[0]["logo"];
                            String tur = film5[0]["tur"];
                            String yil = film5[0]["yil"];
                            String yildiz = film5[0]["yildiz"];
                            String saat = film5[0]["saat"];
                            String aciklama = film5[0]["aciklama"];
                            String yukleyen = film5[0]["yukleyen"];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => filmsayfasi(
                                      adi,
                                      anaResim,
                                      logo,
                                      saat,
                                      tur,
                                      yil,
                                      yildiz,
                                      yonetmen,
                                      aciklama,
                                      yukleyen)),
                            );
                          },
                          child: Container(
                            child: Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/jhonwicklogo.jpg",
                                    width: 180,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "john Wick: 3",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        );
                      }),
                  FutureBuilder<QuerySnapshot>(
                      future: filmlerRef
                          .where("adi", isEqualTo: "Aynı Yıldızın Altında")
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var query = snapshot.data;
                          query!.docs.forEach((doc) async {
                            var veri =
                                await doc.data() as Map<dynamic, dynamic>;
                            film6.add(veri);
                          });
                        }
                        return InkWell(
                          onTap: () {
                            String adi = film6[0]["adi"];
                            String yonetmen = film6[0]["Yönetmen"];
                            String anaResim = film6[0]["anaResim"];
                            String logo = film6[0]["logo"];
                            String tur = film6[0]["tur"];
                            String yil = film6[0]["yil"];
                            String yildiz = film6[0]["yildiz"];
                            String saat = film6[0]["saat"];
                            String aciklama = film6[0]["aciklama"];
                            String yukleyen = film6[0]["yukleyen"];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => filmsayfasi(
                                      adi,
                                      anaResim,
                                      logo,
                                      saat,
                                      tur,
                                      yil,
                                      yildiz,
                                      yonetmen,
                                      aciklama,
                                      yukleyen)),
                            );
                          },
                          child: Container(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/faultoflogo.jpg",
                                    width: 180,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Aynı Yıldızın Altında",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => filmekle()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.black),
                child: Text("Film Ekle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
