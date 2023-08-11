import 'package:flutter/material.dart';


class customButton extends StatelessWidget {
  const customButton({super.key, required this.ontap,this.isLoaddin=false});
  final void Function()? ontap;
  final bool isLoaddin;
  
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap: ontap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 25, 202, 117),
            ),
            child: Center(
                child: Text(
              'Add',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
          ),
        );
      
    
  }
}
