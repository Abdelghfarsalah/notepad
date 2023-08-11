import 'package:flutter/material.dart';

class textFiled extends StatelessWidget {
  const textFiled(
      {super.key, required this.text,required this.onChanged, this.maxheight = 1, this.onSaved});
  final String text;
  final int maxheight;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'this is required';
        } else {
          return null;
        }
      },
      maxLines: maxheight,
      decoration: InputDecoration(
        
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16)),
        label: Text(
          '$text',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
