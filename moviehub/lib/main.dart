import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/anasayfa.dart';
import 'package:moviehub/girisyap.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: movieHub(),
  ));
}

class movieHub extends StatelessWidget {
  const movieHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return girisyap();
  }
}
