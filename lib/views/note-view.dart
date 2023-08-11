import 'package:flutter/material.dart';
import 'widget/customnoteviewbody.dart';
import 'widget/showModalBottomSheet.dart';

class nodeview extends StatefulWidget {
  const nodeview({super.key});

  @override
  State<nodeview> createState() => _nodeviewState();
}

class _nodeviewState extends State<nodeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Noteviewbody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (context) {
              return showModalBottomSheet1();
            },
          );
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
