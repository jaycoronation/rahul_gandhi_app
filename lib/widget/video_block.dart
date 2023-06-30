import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:provider/provider.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../constant/global_context.dart';

class VideoBlock extends StatelessWidget {

  VideoBlock({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 320,
      margin: const EdgeInsets.only(left: 12, right: 12,top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(width: 0.6, color: black.withOpacity(0.4), style: BorderStyle.solid)
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network("https://res.cloudinary.com/dliifke2y/image/upload/v1665054169/gettyimages-107693272-612x612_yiwevv.jpg",
                width: MediaQuery.of(context).size.width, height: 320, fit: BoxFit.cover),
          ),
          Container(
            height: 320,
            decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      blackConst.withOpacity(0.2),
                      blackConst.withOpacity(1),
                    ],
                    stops: const [
                      0.8,
                      1.0
                    ]
                ),
                borderRadius: BorderRadius.circular(0)
            ),
          ),
          Positioned.fill(
            child: Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/play.png',
                height: 46,
                width: 46,
              ),
            ),
          ),
          Positioned(
              bottom: 22,
              left: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: white.withOpacity(0.2)
                    ),
                    alignment: Alignment.center,
                    child: Text("",style: const TextStyle(color: whiteConst,fontSize: 12,fontWeight: FontWeight.w500,fontFamily: gilroy)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      margin: const EdgeInsets.only(top: 12, right: 18,bottom: 22),
                      child: Text(
                        "",
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: const TextStyle(
                            color: whiteConst,
                            fontWeight: FontWeight.w600,
                            fontFamily: gilroy,
                            fontSize: titleFontSize,
                            overflow: TextOverflow.ellipsis),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "",
                          style: TextStyle(fontSize: 14, fontFamily: gilroy, fontWeight: FontWeight.w500, color: white),
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

}
