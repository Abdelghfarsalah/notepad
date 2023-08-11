import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/cubit/getnote/get_all_note_cubit.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/views/Edit-note-viwe.dart';
class NoteItem extends StatelessWidget {
  const NoteItem({super.key,required this.note});
    final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllNoteCubit,GetAllNoteState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return  GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return editNoteViwe(note: note,);
          }));
        },
        child: Container(
          padding: EdgeInsets.only(top: 25,bottom: 25,left: 16),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
            title: Text('${note.title}',style: TextStyle(color: Colors.black,fontSize: 22,fontFamily:'Poppins' ),),
            subtitle:  Padding(
              padding: const EdgeInsets.only(top: 28,bottom: 25),
              child: Text('${note.subTitle}',style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            trailing: IconButton(onPressed: () {
              note.delete();
              BlocProvider.of<GetAllNoteCubit>(context).fetchAllNotes();
            },icon: Icon(Icons.delete,color: Colors.black,size: 30,),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text("${note.date}",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.4) )),
          )
            ],
          )
        ),
      );
    
      },
      );
  }
}