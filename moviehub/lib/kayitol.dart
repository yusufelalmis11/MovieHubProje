import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/anasayfa.dart';
import 'package:moviehub/girisyap.dart';

class kayitol extends StatefulWidget {
  const kayitol({Key? key}) : super(key: key);

  @override
  State<kayitol> createState() => _kayitolState();
}

class _kayitolState extends State<kayitol> {
  @override
  Widget build(BuildContext context) {
    final _firebaseAuth = FirebaseAuth.instance;
    final _kayitolformkey = GlobalKey<FormState>();
    final _epostacontroller = TextEditingController();
    final _sifrecontroller = TextEditingController();
    final _adcontroller = TextEditingController();
    final _soyadcontroller = TextEditingController();
    final db = FirebaseFirestore.instance;
    final CollectionReference kullaniciRef = db.collection("Kullanicilar");

    Future<User?> kullaniciolsutur(String eposta, String sifre) async {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: eposta, password: sifre);
      return userCredentials.user;
    }

    Future<void> cloudkullaniciolustur(
        String uid, String adi, String soyad) async {
      return await kullaniciRef.doc(uid).set({
        "adi": adi,
        "soyadi": soyad,
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: Form(
                      key: _kayitolformkey,
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
                            height: 40,
                          ),
                          TextFormField(
                            controller: _epostacontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Bu alan Boş Bırakılamaz";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff2929292),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: "E-posta",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _adcontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Bu alan Boş Bırakılamaz";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff2929292),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: "Adınız",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _soyadcontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Bu alan Boş Bırakılamaz";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff2929292),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: "Soyadınız",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _sifrecontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Bu alan Boş Bırakılamaz";
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff2929292),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: "Şifre",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_kayitolformkey.currentState!.validate()) {
                                final user = await kullaniciolsutur(
                                    _epostacontroller.text,
                                    _sifrecontroller.text);
                                var uid = await user!.uid;
                                await cloudkullaniciolustur(uid,
                                    _adcontroller.text, _soyadcontroller.text);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Anasayfa(),
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
                                "Kayıt Ol",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Üye misin ?",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
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
                                "Giriş Yap",
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
