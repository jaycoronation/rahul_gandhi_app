import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../utils/app_utils.dart';

class FavBlock extends StatelessWidget {

  FavBlock({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14,right: 14,bottom: 12),
      color: grayBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                "https://res.cloudinary.com/dliifke2y/image/upload/v1665053050/gettyimages-1013854582-2048x2048_gp57y6.jpg",
                width: MediaQuery.of(context).size.width,
                height: 280,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 12,left: 8,right: 8,bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("",
                          style: const TextStyle(
                              color: text_dark, fontFamily: gilroy, fontWeight: FontWeight.w500, fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/share.png', height: 22, width: 22),
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        height: 1.5,
                        color: black,
                        fontWeight: FontWeight.w600,
                        fontFamily: gilroy,
                        fontSize: 16,
                        overflow: TextOverflow.clip),
                    maxLines: 2,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

}
