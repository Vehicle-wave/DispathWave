import 'package:flutter/material.dart';

import '../../../res/assets/app_images.dart';
import '../../../res/constants.dart';
import 'filter_row.dart';

class HomeTopHeader extends StatelessWidget {
  const HomeTopHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                  child: const Icon(Icons.menu,color: Colors.white,)),
              Image.asset(AppImages.logo,height: 50,width: 50,),
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white10,
                child: Center(child: Icon(Icons.notification_important_outlined,size: 15,color: Colors.white,),),
              )
            ],
          ),
          const SizedBox(height: 10,),
          const FilterRow(),
        ],
      ),
    );
  }
}

