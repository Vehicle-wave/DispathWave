
import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_location_outlined,color: Colors.white,size: 30,),
                SizedBox(width: 10,),
                Container(height: 20,width: 1,color: Colors.white54,),
                SizedBox(width: 12,),
                Text('Pick up',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 15
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_location_outlined,color: Colors.white,size: 30,),
                SizedBox(width: 10,),
                Container(height: 20,width: 1,color: Colors.white54,),
                SizedBox(width: 12,),
                Text('Drop off',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 15
                ),)
              ],
            ),
          ],
        ),
        Container(
          height: 40,
          width: 100,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: primaryColor,
                child: Center(
                  child: Icon(Icons.filter_list,color: Colors.white,size: 17,),
                ),
              ),
              Spacer(),
              Text('Filters',style: Theme.of(context).textTheme.labelSmall!.copyWith(

              ),),
              Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
