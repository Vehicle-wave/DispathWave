import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor('#F2AA4C');
Color secondaryColor = HexColor('#101820');
Gradient gradient = LinearGradient(
  colors: [
    primaryColor,
    secondaryColor,
  ], // Replace with your desired gradient colors
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
final spinkit = SpinKitSpinningLines(color: secondaryColor);
