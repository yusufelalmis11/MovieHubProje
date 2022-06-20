import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/filmsayfasi.dart';

class hepsisayfasi extends StatefulWidget {
  const hepsisayfasi({Key? key}) : super(key: key);

  @override
  State<hepsisayfasi> createState() => _hepsisayfasiState();
}

class _hepsisayfasiState extends State<hepsisayfasi> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> filmList = [];
    final db = FirebaseFirestore.instance;

    CollectionReference filmlerRef = db.collection("Filmler");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 15, 15, 15),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20, right: 50),
            child: Center(
              child: Text(
                "Hepsi",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: FutureBuilder<QuerySnapshot>(
          future: filmlerRef.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var querySnappshot = snapshot.data;
              var filmler = querySnappshot!.docs;
              var verimap = filmler.forEach((doc) async {
                var veri = doc.data() as Map<dynamic, dynamic>;
                filmList.add(veri);
              });
              return ListView.builder(
                  itemCount: filmList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 15, 15, 15),
                        ),
                        onPressed: () {
                          String adi = filmList[index]["adi"];
                          String yonetmen = filmList[index]["Yönetmen"];
                          String anaResim = filmList[index]["anaResim"];
                          String logo = filmList[index]["logo"];
                          String tur = filmList[index]["tur"];
                          String yil = filmList[index]["yil"];
                          String yildiz = filmList[index]["yildiz"];
                          String saat = filmList[index]["saat"];
                          String aciklama = filmList[index]["aciklama"];
                          String yukleyen = filmList[index]["yukleyen"];

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
                          width: 200,
                          height: 250,
                          alignment: Alignment.topLeft,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  filmList[index]["logo"],
                                  width: 200,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  filmList[index]["adi"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 100,
                            ),
                          ]),
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
