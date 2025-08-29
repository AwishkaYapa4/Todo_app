import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoapp/const/color.dart';
import 'package:todoapp/screen/add_note_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/data/fairstore.dart';
import 'package:todoapp/widget/stream_note.dart';
import 'package:todoapp/widget/task_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      appBar: AppBar(
        backgroundColor: backgroundColors,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  color: custom_green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Add_creen()));
          },
          backgroundColor: custom_green,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Stream_note(false),
              Text(
                'isDone',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Stream_note(true),
            ],
          ),
        ),
      ),
    );
  }
}
