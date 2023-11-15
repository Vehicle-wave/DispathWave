import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/custom_paint.dart';

class MyLoadContainerWidget extends StatefulWidget {
  final Map<dynamic, dynamic> loadData;
  const MyLoadContainerWidget({super.key, required this.loadData});

  @override
  State<MyLoadContainerWidget> createState() => _MyLoadContainerWidgetState();
}

class _MyLoadContainerWidgetState extends State<MyLoadContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Price: ${widget.loadData['Price'].toString()}\$',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.redAccent),
                  )
                ],
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: primaryColor,
                      ),
                      CustomPaint(
                        size: Size(50, 50.0),
                        painter: VerticalDottedLinePainter(),
                      ),
                      Icon(
                        Icons.location_on_sharp,
                        color: primaryColor,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pick-up',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Container(
                        width: 290,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                widget.loadData['pickup address'],
                                style: TextStyle(color: secondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Drop-off',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Container(
                        width: 290,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                widget.loadData['dropff address'],
                                style: TextStyle(color: secondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
