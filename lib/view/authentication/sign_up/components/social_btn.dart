import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  const SocialBtn({super.key, this.text, this.icon});
  final String? text;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width/1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon!,height: 20,width: 20,),
          SizedBox(width: 10,),
          Text(text.toString(),style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Colors.black,
          ),),

        ],
      ),
    );
  }
}