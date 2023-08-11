import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/views/note-view.dart';
import 'cubit/addNote/add_note_cubit.dart';
import 'cubit/getnote/get_all_note_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('Box_note');

  runApp(const noteapp());
}

class noteapp extends StatelessWidget {
  const noteapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>GetAllNoteCubit()),
        BlocProvider(create: (context)=>AddNoteCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const nodeview(),
      ),
    );
  }
}
