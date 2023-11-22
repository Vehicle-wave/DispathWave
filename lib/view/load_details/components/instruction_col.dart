import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class InstructionColumn extends StatelessWidget {
  InstructionColumn({super.key, required this.prefix, required this.postFix, this.check=false});
  final String prefix;
  final String postFix;
  final bool check;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              TextSpan(children: [
                TextSpan(
                  text: prefix,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: postFix,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                    color: primaryColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: check? FontWeight.bold:null,
                    decorationColor: primaryColor,
                    decoration: check? TextDecoration.underline:null
                  ),
                )
              ])),
        ],
      ),
    );
  }
}