import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';


class SocialBlock extends StatelessWidget {

  const SocialBlock({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: grayBg,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                "https://res.cloudinary.com/dliifke2y/image/upload/v1665053050/gettyimages-1013854582-2048x2048_gp57y6.jpg",
                width: MediaQuery.of(context).size.width,
                height: 320,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: whiteConst.withOpacity(0.7)
                    ),
                    width: 40,
                    height: 30,
                    padding: const EdgeInsets.all(6),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/ic_twitter_new_navigation.png",
                      height: 24,
                      width: 24,
                      color: blackConst,
                    )),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                   "Congress leader Rahul Gandhi on Sunday questioned the Centre over unemployment and alleged that two lakh jobs were 'eliminated' from PSUs, while also accusing the government of trampling upon the hopes of youths for the 'benefit of a few crony capitalist friends'.",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle (
                        color: black,
                        fontWeight: FontWeight.w600,
                        fontFamily: gilroy,
                        fontSize: titleFontSize,),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/share.png', height: 22, width: 22),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Text("June 18, 2023",
                style: const TextStyle(
                    color: text_dark, fontFamily: gilroy, fontWeight: FontWeight.w600, fontSize: 12)),
          ),
        ],
      ),
    );
  }

}
