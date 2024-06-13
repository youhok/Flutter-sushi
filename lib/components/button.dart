import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mybutton extends StatelessWidget {
  final String text;
  void Function()? onTap;
Mybutton({super.key, required this.text , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(212, 135, 81, 77),
            borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
      
          const SizedBox(width: 10),
          //icon
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
