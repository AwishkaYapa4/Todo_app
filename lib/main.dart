import 'package:flutter/material.dart';
import 'package:todoapp/auth/auth_page.dart';
import 'package:todoapp/auth/main_page.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/screen/add_note_screen.dart';
import 'package:todoapp/screen/home.dart';
import 'package:todoapp/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Main_Page());
  }
}
