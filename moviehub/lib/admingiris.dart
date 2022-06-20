import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/adminsayfasi.dart';
import 'package:moviehub/anasayfa.dart';
import 'package:moviehub/girisyap.dart';

class admingiris extends StatefulWidget {
  const admingiris({Key? key}) : super(key: key);

  @override
  State<admingiris> createState() => _admingirisState();
}

class _admingirisState extends State<admingiris> {
  @override
  Widget build(BuildContext context) {
    final _admingirisformkey = GlobalKey<FormState>();
    final _kullaniciadicontroller = TextEditingController();
    final _sifrecontroller = TextEditingController();

    final db = FirebaseFirestore.instance;
    var adminref = db.collection("Kullanicilar").doc("Admin");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: Form(
                      key: _admingirisformkey,
                      child: Column(
                        children: [
                          Text(
                            "MovieHub",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Admin Girişi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _kullaniciadicontroller,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xff2929292),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: "Kullanıcı Adı",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _sifrecontroller,
                            obscureText: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xff2929292),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: "Şifre",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var documentsnap = await adminref.get();
                              var map = await documentsnap.data()
                                  as Map<dynamic, dynamic>;

                              if (map["kullaniciadi"] ==
                                      _kullaniciadicontroller.text &&
                                  map["sifre"] == _sifrecontroller.text) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => adminsayfasi(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, onPrimary: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 60, left: 60, top: 10, bottom: 10),
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => girisyap(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, onPrimary: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, left: 15, top: 5, bottom: 5),
                              child: Text(
                                "Giriş Sayfasi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
