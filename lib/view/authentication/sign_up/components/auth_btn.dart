
import 'package:flutter/material.dart';

import '../../../../res/constants.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({super.key, this.loading=false, this.onTap, required this.text});
  final bool loading;
  final VoidCallback? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width/1.5,
        decoration: BoxDecoration(
            color: Color(0xffF41515),
            borderRadius: BorderRadius.circular(20)
        ),
        child: !loading? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(text,style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
            ),),
            Spacer(),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black12,
              child: Center(
                child: Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 15,),
              ),
            ),
          ],
        ) : SizedBox(width: 20,height: 20,child: SpinKit(color: Colors.white,),),
      ),
    );
  }
}