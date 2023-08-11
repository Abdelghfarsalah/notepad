import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/views/widget/customappbar.dart';
import 'package:notepad/views/widget/noteitem.dart';
import 'customTextFiled.dart';
import '../../cubit/addNote/add_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/getnote/get_all_note_cubit.dart';
class editnoteviwebody extends StatefulWidget {
  editnoteviwebody({super.key,required this.note});

  final NoteModel note;
  @override
  State<editnoteviwebody> createState() => _editnoteviwebodyState();
}

class _editnoteviwebodyState extends State<editnoteviwebody> {
  String? t,st;
  @override
  Widget build(BuildContext context) {
      
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const SizedBox(height: 50,),
          customappbar(
            onpressed: (){
              widget.note.title=t??widget.note.title;
              widget.note.subTitle=st??widget.note.subTitle;
              widget.note.color=BlocProvider.of<AddNoteCubit>(context).color;
              widget.note.save();
              BlocProvider.of<GetAllNoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon:const Icon(Icons.check),
          ),
          const  SizedBox(height: 100,),
            textFiled(
              text: 'title',
              onChanged: (data) {
                t=data;
              },
            ),
          const  SizedBox(height: 16,),
            textFiled(
              onChanged: (data) {
                st=data;
              },
              text: 'content',maxheight: 5,),
          const SizedBox(height: 25,),
          const listcolor(),
          const SizedBox(height: 25,),
          NoteItem(note: widget.note),
        ],
      ),
    );
  }
}
class listcolor extends StatefulWidget {
  const listcolor({super.key});

  @override
  State<listcolor> createState() => _listcolorState();
}
class _listcolorState extends State<listcolor> {
  final List<Color> colorList = const [
    Color(0xffDE1A1A),
    Color(0xffE8EBF7),
    Color(0xffacbed8),
    Color(0xfff2d398),
    Color(0xffd78521),
    Color(0xff2274a5),
    Color(0xff816c61),
    Color(0xff131b23),
    Color(0xffe9f1f7),
    Color(0xffe7dfc6),
  ];
  int currentState=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        
        scrollDirection: Axis.horizontal,
        itemCount: colorList.length,
        itemBuilder: (context, index) {
          
          return GestureDetector(
            onTap: () {
              
              currentState=index;
              BlocProvider.of<AddNoteCubit>(context).color=colorList[index].value;
              setState(() {
                
              });
            },
            child: circular(
              color: colorList[index],
              isActive:currentState==index ,
            ),
          );
        },
      ),
    );
  }
}

class circular extends StatelessWidget {
  const circular({super.key,required this.color,required this.isActive});
  final Color color;
  final bool isActive;
  
  @override
  
  Widget build(BuildContext context) {
    return isActive? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child:  CircleAvatar(
        backgroundColor: Colors.white,
        radius: 41,
        child: CircleAvatar(
        radius: 38,
        backgroundColor:color ,
      ),
      ),
    ): Padding(
      padding: const EdgeInsets.all(5),
      child: CircleAvatar(
          radius: 38,
          backgroundColor:color ,
        ),
    );
  }
}
