import 'dart:ui';

import 'package:flutter/material.dart';

class filmsayfasi extends StatefulWidget {
  final String adi,
      logo,
      anaResim,
      yonetmen,
      saat,
      tur,
      yil,
      yildiz,
      aciklama,
      yukleyen;
  const filmsayfasi(this.adi, this.anaResim, this.logo, this.saat, this.tur,
      this.yil, this.yildiz, this.yonetmen, this.aciklama, this.yukleyen);

  @override
  State<filmsayfasi> createState() => _filmsayfasiState();
}

class _filmsayfasiState extends State<filmsayfasi> {
  @override
  Widget build(BuildContext context) {
    String resim = widget.anaResim;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Stack(children: [
            Image.network(
              resim,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 170),
                Center(
                  child: Column(
                    children: [
                      Text(
                        widget.adi,
                        style: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Puan = ",
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text(
                            "${widget.yildiz}",
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.yil,
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.saat,
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.tur,
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Yönetmen: ",
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.yonetmen,
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Yükleyen: ",
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.yukleyen,
                            style: TextStyle(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              "Açıklama",
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              backgroundColor: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: widget.aciklama),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
