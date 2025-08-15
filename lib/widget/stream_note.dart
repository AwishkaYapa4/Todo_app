import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:todoapp/data/fairstore.dart';
import 'package:todoapp/widget/task_widget.dart';

class Stream_note extends StatelessWidget {
  final bool done;
  const Stream_note(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Fairstore_Datasource().stream(done),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final noteslist = Fairstore_Datasource().getNotes(snapshot);
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final note = noteslist[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                // If you have a delete method, call it here. Otherwise, remove this line or implement it.
                // Fairstore_Datasource().delet_note(note.id);
              },
              child: Task_widget(note),
            );
          },
          itemCount: noteslist.length,
        );
      },
    );
  }
}
