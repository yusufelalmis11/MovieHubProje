import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviehub/anasayfa.dart';

class filmekle extends StatefulWidget {
  const filmekle({Key? key}) : super(key: key);

  @override
  State<filmekle> createState() => _filmekleState();
}

class _filmekleState extends State<filmekle> {
  late File yuklenecekdosya;
  late File yuklenecekdosya2;
  final turler = ["Aksiyon", "Animasyon", "Romantik"];
  String? value;

  final firestore = FirebaseStorage.instance;

  LogoYukle() async {
    try {
      var alinanDosya =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (alinanDosya == null) return;
      final imageTempory = File(alinanDosya.path);
      setState(() => this.yuklenecekdosya = imageTempory);
      print(yuklenecekdosya);
    } on PlatformException catch (e) {
      print("Resimde hata var $e");
    }
  }

  AnaResimYukle() async {
    try {
      var alinanDosya =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (alinanDosya == null) return;
      final imageTempory = File(alinanDosya.path);
      setState(() => this.yuklenecekdosya2 = imageTempory);
      print(yuklenecekdosya2);
    } on PlatformException catch (e) {
      print("Resimde hata var $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _adicontroller = TextEditingController();
    final _aciklamacontroller = TextEditingController();
    final _yonetmencontroller = TextEditingController();
    final _saatcontroller = TextEditingController();
    final _turcontroller = TextEditingController();
    final _yilcontroller = TextEditingController();
    final _yildizcontroller = TextEditingController();

    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final _filmkey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 95,
                    ),
                    Text(
                      "Film Ekle",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              Form(
                key: _filmkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 300,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff2929292)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 15),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value,
                            isExpanded: true,
                            iconSize: 36,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            items: turler.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(
                              () => this.value = value,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _adicontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff2929292),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Film Adı",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          LogoYukle();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: Colors.black),
                        child: Text("Logo Yükle")),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          AnaResimYukle();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: Colors.black),
                        child: Text("Afiş Yükle")),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _aciklamacontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff2929292),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Film Açıklaması",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _yonetmencontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff2929292),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Film Yönetmen Adı",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _saatcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff2929292),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Film Süresi",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _yilcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff2929292),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Film Yayınlanış Yılı",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _yildizcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff2929292),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Film Puanı (1-5 arası)",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        print("burada4");
                        var storageRef1 = await firestore
                            .ref()
                            .child("resimler")
                            .child(
                                "${DateTime.now().millisecondsSinceEpoch}.${yuklenecekdosya.path.split(".").last}");

                        var storageRef2 = await firestore
                            .ref()
                            .child("resimler")
                            .child(
                                "${DateTime.now().millisecondsSinceEpoch}.${yuklenecekdosya2.path.split(".").last}");

                        print("burada3");
                        await storageRef1.putFile(yuklenecekdosya);
                        await storageRef2.putFile(yuklenecekdosya2);
                        print("burada2");
                        var url = await storageRef1.getDownloadURL();
                        var url2 = await storageRef2.getDownloadURL();
                        print("burada");
                        String uid = await auth.currentUser!.uid;
                        DocumentReference userref =
                            await db.collection("Kullanicilar").doc(uid);
                        var documentsnapshot = await userref.get();
                        var map = await documentsnapshot.data()
                            as Map<dynamic, dynamic>;
                        String ad = map["adi"];
                        String soyad = map["soyadi"];
                        await db
                            .collection("Filmler")
                            .doc("${_adicontroller.text}")
                            .set({
                          "adi": "${_adicontroller.text}",
                          "aciklama": "${_aciklamacontroller.text}",
                          "anaResim": "${url2}",
                          "logo": "$url",
                          "saat": "${_saatcontroller.text}",
                          "tur": "$value",
                          "yil": "${_yilcontroller.text}",
                          "yildiz": "${_yildizcontroller.text}",
                          "Yönetmen": "${_yonetmencontroller.text}",
                          "yukleyen": "$ad $soyad",
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Anasayfa()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 7, bottom: 7, right: 30, left: 30),
                        child: Text(
                          "Film Ekle",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
