// ignore_for_file: prefer_const_constructors

import 'package:aroma_blend_app/Pages/main_page.dart';
import 'package:aroma_blend_app/firebase_options.dart';
import 'package:aroma_blend_app/models/shop.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AromaBlend(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.brown),
        home: MainPage(),
      ),
    );
  }
}
