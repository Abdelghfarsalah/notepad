import 'package:flutter/material.dart';
import 'formsheet.dart';

class showModalBottomSheet1 extends StatelessWidget {
  const showModalBottomSheet1({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding:  EdgeInsets.only(top: 16, left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
          child:const SingleChildScrollView(
                child:  FormSheet(),
            ),
        
    );
  }
}



