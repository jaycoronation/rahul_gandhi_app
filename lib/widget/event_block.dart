import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:provider/provider.dart';
import 'package:rahul_gandhi_app/model/CommonModelResponse.dart';
import '../CommonDetailPageScreen.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../constant/global_context.dart';


class EventBlock extends StatelessWidget {
  final CommonModelResponse getSet;


  EventBlock(this.getSet, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(getSet)));
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
                getSet.title.toString(),
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
            "${getSet.place} . ${getSet.date}",
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
              getSet.description.toString(),
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontFamily: gilroy,
                fontWeight: FontWeight.w500,
                color: text_dark,
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
              Container(height: 0,),
              const Text(
                "",
                maxLines: 4,
                style: TextStyle(color: text_dark, height: 1.5,fontSize: 14, fontWeight: FontWeight.w500,fontFamily: gilroy),
              ),
              Container(height: 12,),
              Container(height: 12,),
              Image.network(
                getSet.img.toString(),
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
