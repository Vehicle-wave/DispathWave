import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets/app_icon.dart';

class InputField extends StatelessWidget {
  const InputField({super.key,  this.icon, required this.hint, required this.controller, this.suffix, this.obscure});
  final String? icon;
  final String hint;
  final Widget? suffix;
  final bool? obscure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: TextFormField(
        controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          obscureText: obscure?? false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            hintText: hint,
            prefixIcon:icon!=null ? Image.asset(icon!):null,
            suffixIcon: suffix,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              fontSize: 13
            ),
            hoverColor: Colors.black,
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.5),
                )),

          )),
    );
  }
}
