import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';
import 'widget/EditNoteBody.dart';
class editNoteViwe extends StatelessWidget {
  const editNoteViwe({super.key,required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: editnoteviwebody(note: note,),
    );
  }
}

