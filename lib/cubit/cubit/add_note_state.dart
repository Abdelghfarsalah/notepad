part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class AddNotLoadding extends AddNoteState {}
class AddNotSuccess extends AddNoteState {}
class AddNotefauiler extends AddNoteState {}
