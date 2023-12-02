import 'package:flutter/material.dart';

class AdminOptionButton extends StatelessWidget {
  const AdminOptionButton({super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.grey.withOpacity(.01)
          )
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 130,
          width: 130,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon,height: 70,width: 70,),
              Text(text,style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}