
import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class LoadCardButton extends StatelessWidget {
  const LoadCardButton({super.key, required this.text, required this.color, required this.fontSize,this.width=80,this.height=35, this.textColor,  this.loading=false, this.spinKitColor});
  final String text;
  final Color color;
  final Color? textColor;
  final double fontSize;
  final double height;
  final double width;
  final bool loading;
  final Color? spinKitColor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: text=='Accept'?Colors.green : color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: loading? SizedBox(width: 20,height: 20,child: SpinKit(color: spinKitColor?? primaryColor,),) :Text(text,style: Theme.of(context).textTheme.labelLarge!.copyWith(
        color:textColor?? Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),),
    );
  }
}

