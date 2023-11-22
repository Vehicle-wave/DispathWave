import 'package:flutter/material.dart';

class StatusButtons extends StatelessWidget {
  const StatusButtons({super.key, required this.text,  this.onTap, required this.selected});
  final String text;
  final VoidCallback? onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.withOpacity(.1)
          )
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              color: selected?Colors.green :Colors.white ,borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}