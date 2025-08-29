import 'package:flutter/material.dart';
import 'package:todoapp/screen/home.dart';
import 'package:todoapp/auth/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home_Screen();
          } else {
            return Auth_page();
          }
        },
      ),
    );
  }
}
