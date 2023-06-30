import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../utils/app_utils.dart';

class TownHallBlock extends StatelessWidget {


  TownHallBlock({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Card(
      margin: const EdgeInsets.only(top: 14,),
      elevation: 0,
      color: whiteConst,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: blackConst,
                        fontWeight: FontWeight.w600,
                        fontFamily: gilroy,
                        fontSize: titleFontSize,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(height: 12,),
                  Text(
                   "",
                    maxLines: 4,
                    style: const TextStyle(color: text_dark, height: 1.5,fontSize: 14, fontWeight: FontWeight.w500,fontFamily: gilroy),
                  ),
                  Container(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                        color: orangeNewOne,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Text(
                        "Meeting Starts in ",
                        style: const TextStyle(color: whiteConst, height: 1.5,fontSize: 14, fontWeight: FontWeight.w500,fontFamily: gilroy),
                      ),
                    ),
                  ),
                  Container(height: 12,),

                ],
              ),
            ),
            // Gap(12),
            Image.network(
              "https://res.cloudinary.com/dliifke2y/image/upload/v1665054169/gettyimages-1071160188-612x612_wpoupi.jpg",
              fit: BoxFit.cover,
              height: 110,
              width: 110,
            ),
          ],
        ),
      ),
    );
  }


}
class _CountdownDemo extends StatefulWidget { final int endTime;

_CountdownDemo(this.endTime);

@override __CountdownDemoState createState() => __CountdownDemoState(); }

class __CountdownDemoState extends State<_CountdownDemo> { late CountdownTimerController countdownTimerController;

@override Widget build(BuildContext context) {
  return CountdownTimer(
    controller: countdownTimerController,
    widgetBuilder: (context, time) {
      if (time == null) {
        return Text('Game over');
      }
      return Text(
          'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
    },
  );
}

@override void initState() { super.initState(); countdownTimerController = CountdownTimerController(endTime: widget.endTime); } }
