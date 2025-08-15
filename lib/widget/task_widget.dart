import 'package:todoapp/const/color.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screen/edit_screen.dart';

import 'package:todoapp/model/notes_model.dart';

class Task_widget extends StatefulWidget {
  final Note _note;
  const Task_widget(this._note, {super.key});

  @override
  State<Task_widget> createState() => _Task_widgetState();
}

bool isDone = false;

class _Task_widgetState extends State<Task_widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            imagee(),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget._note.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: isDone,
                        onChanged: (value) {
                          setState(() {
                            isDone = !isDone;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Text(
                    widget._note.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 28,
                          decoration: BoxDecoration(
                            color: custom_green,
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                Image.asset('images/icon_time.png'),
                                SizedBox(width: 10),
                                Text(
                                  widget._note.time,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Edit_Screen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 90,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Color(0xffE2F6F1),
                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('images/icon_edit.png'),
                                  SizedBox(width: 10),
                                  Text(
                                    'title',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container imagee() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/${widget._note.image}.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
