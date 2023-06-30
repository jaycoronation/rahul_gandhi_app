import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:provider/provider.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../constant/global_context.dart';


class NewsBlock extends StatelessWidget {

  NewsBlock({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(14, 12, 14, 12),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: BoxDecoration(
        color: grayBg,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("",
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w600,
                          fontFamily: gilroy,
                          fontSize: titleFontSize,),
                        maxLines: 4,
                      ),
                      Container(height: 14,),
                      Text("",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: const TextStyle(
                              color: text_dark,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: gilroy,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis)
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network("https://res.cloudinary.com/dliifke2y/image/upload/v1665053049/gettyimages-1047067112-1024x1024_ctzwwz.jpg", width: 100, height: 100, fit: BoxFit.cover),
                ),
              )
            ],
          ),
          Container(
            height: 18,
          ),
          Row(
            children: [
              Text(
                "",
                style: TextStyle(fontSize: 13, fontFamily: gilroy, fontWeight: FontWeight.w400, color: newsText),
              ),

              Text(
                "",
                style:  TextStyle(fontSize: 13, fontFamily: gilroy, fontWeight: FontWeight.w400, color: newsText),
              ),
              const Spacer(),

              Container(
                width: 8,
              )

            ],
          ),
          Container(
            height: 8,
          ),
        ],
      ),
    );
  }

}
