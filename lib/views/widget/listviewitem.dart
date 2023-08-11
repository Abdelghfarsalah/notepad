// import 'package:flutter/material.dart';
// import 'package:notepad/cubit/getnote/get_all_note_cubit.dart';
// import 'package:notepad/models/note_model.dart';
// import 'noteitem.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class listviewItem extends StatelessWidget {
//   const listviewItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   BlocBuilder<GetAllNoteCubit, GetAllNoteState>(
      
//       builder: (context, state) {
//         List<NoteModel> notelist=BlocProvider.of<GetAllNoteCubit>(context).getnote();
//         return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: notelist.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: NoteItem(note: notelist[index]),
//                     );
//                   },
//                 ),
//               );
//       },
//     );
//   }
// }
