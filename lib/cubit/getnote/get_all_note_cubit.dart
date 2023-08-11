import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../models/note_model.dart';
part 'get_all_note_state.dart';

class GetAllNoteCubit extends Cubit<GetAllNoteState> {
  GetAllNoteCubit() : super(GetAllNoteInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>('Box_note');
    notes = notesBox.values.toList();
    emit(GetAllNotesuccess());
  }
}
