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
    return   Scaffold(
            body: Noteviewbody(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (context) {
                      return showModalBottomSheet1();
                    });
              },
              child: Icon(Icons.add),
            ),
        );
      
  }
}
