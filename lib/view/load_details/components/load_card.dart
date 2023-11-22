import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class LoadCard extends StatelessWidget {
   LoadCard({super.key, required this.prefix, required this.postFix});
   final String prefix;
   final String postFix;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.1))
      ),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Text.rich(
         maxLines: 2,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            children: [
              TextSpan(
                text: prefix,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextSpan(
                text: postFix,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: primaryColor,
                  overflow: TextOverflow.ellipsis,
                ),

              )

            ]
        )),
      ),
    );
  }
}


