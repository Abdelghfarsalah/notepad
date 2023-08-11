import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../cubit/addNote/add_note_cubit.dart';
import 'customTextFiled.dart';
import '../../models/note_model.dart';
import 'custombutton.dart';
import '../../cubit/getnote/get_all_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSheet extends StatefulWidget {
  const FormSheet({
    super.key,
  });

  @override
  State<FormSheet> createState() => _FormSheetState();
}

class _FormSheetState extends State<FormSheet> {
  GlobalKey<FormState> kform = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: kform,
      child: Column(
        children: [
          textFiled(
            onChanged: (data) {
              title = data;
            },
            onSaved: (value) {
              title = value;
            },
            text: 'title',
          ),
        const  SizedBox(
            height: 16,
          ),
          textFiled(
            onChanged: (data) {
              subtitle = data;
            },
            onSaved: (value) {
              subtitle = value;
            },
            text: 'content',
            maxheight: 5,
          ),
        const  SizedBox(
            height: 25,
          ),
        const  listcolor(),
        const  SizedBox(
            height: 25,
          ),
          customButton(
            ontap: () {
              if (kform.currentState!.validate()) {
                var time = DateTime.now();
                var currenttime = DateFormat('dd-mm-yyyy').format(time);
                autovalidateMode = AutovalidateMode.always;
                NoteModel note = NoteModel(
                    title: title!,
                    subTitle: subtitle!,
                    date: currenttime,
                    color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context).addnote(note);
                BlocProvider.of<GetAllNoteCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            },
          )
          ,SizedBox(height: 20,)
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
