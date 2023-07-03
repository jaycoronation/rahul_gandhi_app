import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:provider/provider.dart';
import 'package:rahul_gandhi_app/model/CommonModelResponse.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../constant/global_context.dart';

class CSRBlock extends StatelessWidget {
  bool isFromRelated = false;
  final CommonModelResponse setData;

  CSRBlock(this.setData, {Key? key,}) : super(key: key);

  // CSRBlock({Key? key, required this.listPost, required this.index, required this.setState, this.isFromRelated = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // if (isFromRelated)
        //   {
        //     Navigator.pop(context);
        //   }
        // detailsPageIntent(context,setState,listPost,index);
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 370,
        color: grayBg,
        margin: EdgeInsets.only(top: 14,right: 12,left: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                   setData.img.toString(),
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              blackConst.withOpacity(0.0),
                              blackConst.withOpacity(1),
                            ],
                            stops: const [
                              0.7,
                              1.0
                            ]),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(6, 6, 12, 12),
                    child: Text(
                      setData.title.toString(),
                      style: const TextStyle(
                          color: blackConst,
                          fontWeight: FontWeight.w600,
                          fontFamily: gilroy,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(6, 0, 12, 6),
                    padding: const EdgeInsets.only( right: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          setData.place.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15, fontFamily: gilroy, fontWeight: FontWeight.w400, color: blackConst),
                        ),

                        // Flexible(
                        //   child: Text(
                        //     setData.date.toString(),
                        //     overflow: TextOverflow.ellipsis,
                        //     style:  const TextStyle(fontSize: 15, fontFamily: gilroy, fontWeight: FontWeight.w400, color: blackConst),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }

}
