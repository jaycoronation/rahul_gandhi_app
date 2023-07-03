
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rahul_gandhi_app/model/CommonModelResponse.dart';
import 'package:rahul_gandhi_app/utils/base_class.dart';

import 'common_widget/common_widget.dart';
import 'constant/colors.dart';

class DetailScreen extends StatefulWidget {
  final CommonModelResponse getSet;


  DetailScreen(this.getSet, {Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}


class _DetailScreenState extends BaseState<DetailScreen> {
  CommonModelResponse getSet = CommonModelResponse();
  @override
  void initState(){
    getSet = (widget as DetailScreen).getSet;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   return WillPopScope(
       child: Scaffold(
        appBar : AppBar(
           toolbarHeight:  55,
           automaticallyImplyLeading: false,
           backgroundColor: screenBg,
           elevation: 0,
           centerTitle: false,
           leading: InkWell(
             onTap: () {
              Navigator.pop(context);
             },
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Image.asset('assets/images/ic_back_button.png', width: 4, height: 4,color: black,),
             ),
           ),
           titleSpacing: 0,
         ),
         body: Card(
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
                   getSet.date.toString(),
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
                   getSet.place.toString(),
                   // overflow: TextOverflow.ellipsis,
                   style: const TextStyle(
                     fontSize: 16,
                     fontFamily: gilroy,
                     fontWeight: FontWeight.w500,
                     color: text_dark,
                     // overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Container(height: 12,),
                 Image.network(
                   getSet.img.toString(),
                   fit: BoxFit.cover,
                   height: 200,
                   width: MediaQuery.of(context).size.width,
                 ),
                 Container(height: 12,),
                 Text(
                   getSet.description.toString(),
                   maxLines: 4,
                   style: TextStyle(color: text_dark, height: 1.5,fontSize: 14, fontWeight: FontWeight.w500,fontFamily: gilroy),
                 ),
                 Container(height: 12,),
               ],
             ),
           ),
         ),
       ),
       onWillPop: () {
         Navigator.pop(context);
         return Future.value(true);
       }
   );
  }

  @override
  void castStatefulWidget() {
   widget is DetailScreen;
  }

}