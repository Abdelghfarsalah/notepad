import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/cubit/getnote/get_all_note_cubit.dart';
import 'package:notepad/models/note_model.dart';
import 'customappbar.dart';
import 'noteitem.dart';

class Noteviewbody extends StatefulWidget {
  const Noteviewbody({super.key});

  @override
  State<Noteviewbody> createState() => _NoteviewbodyState();
}

class _NoteviewbodyState extends State<Noteviewbody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const customappbar(
            title: 'Notes',
            icon: Icon(Icons.search),
          ),
          Expanded(child: BlocBuilder<GetAllNoteCubit, GetAllNoteState>(
            builder: (context, state) {
              BlocProvider.of<GetAllNoteCubit>(context).fetchAllNotes();
              List<NoteModel> notes =
                  BlocProvider.of<GetAllNoteCubit>(context).notes!;
                  BlocProvider.of<GetAllNoteCubit>(context).fetchAllNotes();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: NoteItem(
                        note: notes[index],
                      ),
                    );
                  },
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
