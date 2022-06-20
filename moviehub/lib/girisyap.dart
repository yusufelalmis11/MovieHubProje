import 'package:flutter/material.dart';
import 'package:moviehub/admingiris.dart';
import 'package:moviehub/anasayfa.dart';
import 'package:moviehub/kayitol.dart';
import 'package:firebase_auth/firebase_auth.dart';

class girisyap extends StatefulWidget {
  const girisyap({Key? key}) : super(key: key);

  @override
  State<girisyap> createState() => _girisyapState();
}

class _girisyapState extends State<girisyap> {
  @override
  Widget build(BuildContext context) {
    final _firebaseAuth = FirebaseAuth.instance;
    final _girisformkey = GlobalKey<FormState>();
    final _epostacontroller = TextEditingController();
    final _sifrecontroller = TextEditingController();

    Future<User?> kullanicigirisi(String eposta, String sifre) async {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: eposta, password: sifre);
      return userCredentials.user;
    }

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
                      key: _girisformkey,
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
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: "E-posta",
                                hintStyle: TextStyle(color: Colors.white)),
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
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: "Şifre",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_girisformkey.currentState!.validate()) {
                                final user = await kullanicigirisi(
                                    _epostacontroller.text,
                                    _sifrecontroller.text);
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
                                "Giriş Yap",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Hala üye olmadın mı?",
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
                                  builder: (context) => kayitol(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, onPrimary: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, left: 15, top: 5, bottom: 5),
                              child: Text(
                                "Kayıt Ol",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => admingiris(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, onPrimary: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, left: 15, top: 5, bottom: 5),
                              child: Text(
                                "Admin Girişi",
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
