import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../common_widget/common_widget.dart';
import '../common_widget/loading.dart';
import '../common_widget/loading_more.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../model/CommonModelResponse.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import '../widget/event_block.dart';


class EventScreenTab extends StatefulWidget {
  const EventScreenTab({Key? key}) : super(key: key);

  @override
  _EventScreenTab createState() => _EventScreenTab();
}

class _EventScreenTab extends BaseState<EventScreenTab> {
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _pageIndex = 0;
  final int _pageResult = 15;
  bool _isLastPage = false;
  bool isScrollingDown = false;
  late ScrollController _scrollViewController;

  List<CommonModelResponse> listData = [];

  @override
  void initState() {

    listData.add(CommonModelResponse(date:"July 03, 2023" ,description:"Rahul Gandhi cited the alleged involvement of Telangana Chief Minister K. Chandrashekar Rao’s daughter, K. Kavitha’s, alleged involvement in the Delhi liquor scam case to target the ruling Bharat Rashtra Samithi (BRS) party in the state while speaking at a rally in Telangana Sunday." ,
      img:   "https://static.theprint.in/wp-content/uploads/2023/07/Untitled-design-80.jpg",
      place:"New Delhi" ,title: "Rahul targets KCR at Khammam rally, cites daughter Kavitha’s ‘involvement’ in Delhi liquor scam case",));

    listData.add(CommonModelResponse(date:"June 30, 2023" ,description:"Rahul Gandhi's visit to Manipur will not bring any solution to the tense situation of the state and is only a one-day media hype" ,
      img:   "https://res.cloudinary.com/dliifke2y/image/upload/v1665053049/gettyimages-136752549-2048x2048_ujbtaf.jpg",
      place:"Manipur" ,title: "What solution Rahul Gandhi to bring in Manipur: Himanta Biswa Sarma's jibe at ‘one-day media drama’",));

    listData.add(CommonModelResponse(date:"June 22, 2023" ,description:"Rahul, along with party’s national president Mallikarjun Kharge and national general secretary KC Venugopal will attend the meeting of non-BJP leaders at CM Nitish kumars residence.",
      img:   "https://static.toiimg.com/thumb/msid-101179691,imgsize-23954,width-400,resizemode-4/101179691.jpg",
      place:"Patna", title: "RaGa to address Cong workers at Sadaqat Ashram",));

    listData.add(CommonModelResponse(date:"June 19, 2023" ,description:"Several posters were put up outside All India Congress Committee to wish the Congress leader on his birthday. Congress has also planned to take out a 5-km long Bharat Jodo Yatra in New Delhi.",
      img:   "https://static.toiimg.com/thumb/msid-101099879,imgsize-39808,width-400,resizemode-4/101099879.jpg",
      place:"Patna", title: "Rahul Gandhi 53rd birthday: Wishes pour in for Congress leader.",));
    isBlogReload = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        toolbarHeight:  55,
        automaticallyImplyLeading: false,
        backgroundColor: screenBg,
        elevation: 0,
        centerTitle: false,
        leading: InkWell(
            onTap: () {
              final BottomNavigationBar bar = bottomWidgetKey.currentWidget as BottomNavigationBar;
              bar.onTap!(0);
            },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/images/ic_back_button.png', width: 4, height: 4,color: black,),
          ),
        ),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 65,
                margin: const EdgeInsets.only(left: 5),
                child: appBarTitle('Events & Engagement'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      backgroundColor: grayBg,
      resizeToAvoidBottomInset: true,
      body: _isLoading
          ? const LoadingWidget()
          : Column(
            children: [
              Expanded(
                  child: Stack(
                    children: [
                      AnimationLimiter(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: listData.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Column(
                                    children: [
                                      EventBlock(listData[index]),
                                      Container(height: 20,),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              Visibility(
                  visible: _isLoadingMore,
                  child: const LoadingMoreWidget())
            ],
          ),
    );
  }



  @override
  void castStatefulWidget() {
    widget is EventScreenTab;
  }
}
