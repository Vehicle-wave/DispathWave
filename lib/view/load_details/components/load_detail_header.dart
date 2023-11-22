
import 'package:flutter/material.dart';

import '../../../res/assets/app_images.dart';
import '../../../res/constants.dart';

class LoadDetailHeader extends StatelessWidget {
  const LoadDetailHeader({super.key,  this.text='Load Details'});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  AppImages.logo,
                  height: 70,
                  width: 70,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}