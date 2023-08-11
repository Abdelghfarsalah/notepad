
import 'package:flutter/material.dart';
import 'customIconSearch.dart';
class customappbar extends StatelessWidget {
  const customappbar ({super.key,required this.icon,required this.title,this.onpressed});
  final String title; 
  final Icon icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$title',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        Spacer(flex: 1,),
        searchnote(
          onpressed: onpressed,
          icon: icon,
        ),
      ],
    );
  }
}



