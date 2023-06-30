import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:provider/provider.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../constant/global_context.dart';


class EventBlock extends StatelessWidget {

  EventBlock({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

      },
      child: Card(
        margin: const EdgeInsets.only(top: 14),
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
            color: white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What solution Rahul Gandhi to bring in Manipur: Himanta Biswa Sarma's jibe at ‘one-day media drama’",
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    color: blackConst,
                    fontWeight: FontWeight.w600,
                    fontFamily: gilroy,
                    fontSize: titleFontSize,
                    overflow: TextOverflow.ellipsis),
              ),
              Container(height: 12,),
          Text(
              "Jun 30, 2023",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontFamily: gilroy,
                fontWeight: FontWeight.w400,
                color: black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(height: 12,),
            Text(
              "Rahul Gandhi's visit to Manipur will not bring any solution to the tense situation of the state and is only a one-day media hype",
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontFamily: gilroy,
                fontWeight: FontWeight.w400,
                color: black,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
              // Row(
              //   children: [
              //     Container(
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(22),
              //       ),
              //       padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Jun 30, 2023",
              //             overflow: TextOverflow.ellipsis,
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontFamily: gilroy,
              //               fontWeight: FontWeight.w400,
              //               color: black,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ),
              //
              //           Text(
              //             "Rahul Gandhi's visit to Manipur will not bring any solution to the tense situation of the state and is only a one-day media hype, Assam chief minister Himanta Biswa Sarma said as Rahul Gandhi was stopped from visiting Churachandpur by road and he had to take a helicopter. Police said there was a fear of violence while the Congress refuted the threat perception and blamed BJP's 'dirty political game' behind the drama that unfolded in strife-torn Manipur on Thursday.",
              //             overflow: TextOverflow.ellipsis,
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontFamily: gilroy,
              //               fontWeight: FontWeight.w400,
              //               color: black,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //     Expanded(child: Container())
              //   ],
              // ),
              Container(height: 12,),
              Text(
                "",
                maxLines: 4,
                style: const TextStyle(color: text_dark, height: 1.5,fontSize: 14, fontWeight: FontWeight.w500,fontFamily: gilroy),
              ),
              Container(height: 12,),
              Container(height: 12,),
              Image.network(
                "https://res.cloudinary.com/dliifke2y/image/upload/v1665053049/gettyimages-136752549-2048x2048_ujbtaf.jpg",
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),

            ],
          ),
        ),
      ),
    );
  }

}
