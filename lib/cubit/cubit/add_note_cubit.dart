import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:notepad/models/note_model.dart';
import 'package:hive_flutter/adapters.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int color=Color.fromARGB(255, 82, 6, 30).value;
  addnote(NoteModel note) async {
    note.color=color;
    emit(AddNotLoadding());
    try {
      var notemodel = Hive.box<NoteModel>('Box_note');
      await notemodel.add(note);
      emit(AddNotSuccess());
    } on Exception catch (e) {
      emit(AddNotefauiler());
    }
  }
}