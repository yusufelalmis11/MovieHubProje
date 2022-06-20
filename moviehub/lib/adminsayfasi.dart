import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/anasayfa.dart';
import 'package:moviehub/girisyap.dart';

class adminsayfasi extends StatefulWidget {
  const adminsayfasi({Key? key}) : super(key: key);

  @override
  State<adminsayfasi> createState() => _adminsayfasiState();
}

class _adminsayfasiState extends State<adminsayfasi> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> filmlerList = [];
    final db = FirebaseFirestore.instance;
    var filmref = db.collection("Filmler");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Admin Paneli",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => girisyap()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, onPrimary: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 0, left: 0),
                      child: Text("Çıkış Yap"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: filmref.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    snapshot.data!.docs.forEach((element) {
                      var veri = element.data() as Map<dynamic, dynamic>;
                      filmlerList.add(veri);
                    });
                    return Expanded(
                      child: ListView.builder(
                          itemCount: filmlerList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 25, right: 25),
                              child: Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        filmlerList[index]["logo"],
                                        width: 100,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${filmlerList[index]["adi"]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                        onPressed: () async {
                                          await filmref
                                              .doc(filmlerList[index]["adi"])
                                              .delete();

                                          filmlerList.clear;
                                          setState(() {});
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            onPrimary: Colors.white),
                                        child: Text(
                                          "Sil",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
