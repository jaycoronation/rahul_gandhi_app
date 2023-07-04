import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:rahul_gandhi_app/model/CommonModelResponse.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../CommonDetailPageScreen.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../utils/app_utils.dart';
import '../utils/session_manager.dart';

class WhatsNewBlock extends StatelessWidget {
  final CommonModelResponse getSet;

  WhatsNewBlock(this.getSet, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(getSet)));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 14,right: 14,bottom: 12),
        color: grayBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  getSet.img.toString(),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  fit: BoxFit.cover,
                ),

              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(getSet.date.toString(),
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
                      getSet.title.toString(),
                      style: TextStyle(
                          height: 1.5,
                          color: black,
                          fontWeight: FontWeight.w600,
                          fontFamily: gilroy,
                          fontSize: titleFontSize,
                          overflow: TextOverflow.clip),
                      maxLines: 2,
                    ),
                    Visibility(
                      visible: false,
                      child: Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontFamily: gilroy,
                              fontSize: 14,
                              overflow: TextOverflow.clip),
                          maxLines: 2,
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
