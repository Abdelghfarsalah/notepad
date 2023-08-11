
import 'package:flutter/material.dart';
class searchnote extends StatelessWidget {
  const searchnote({super.key,required this.icon,this.onpressed});
  final Icon icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child: IconButton(onPressed: onpressed,icon: icon,),
    );
  }
}