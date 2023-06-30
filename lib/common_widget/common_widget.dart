

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/colors.dart';

Widget appBarIcon(){
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(left: 0,right:0,top: 4,bottom: 4),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Image.asset('assets/images/ic_Left_Arrow.png', width: 22, height: 22,color: black,),
    ),
  );
}



Widget appBarTitle(String title){
  return Text(
    title,
    textAlign: TextAlign.start,
    style: TextStyle(fontWeight: FontWeight.w700, color: black, fontSize: 18),
  );
}


Widget getCommonButton(String title, void Function() onPressed){
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0F3CC9)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white, ),
      ),
    ),
  );
}

