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

  @override
  void initState() {
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          setState(() {});
        }
      }
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          setState(() {});
        }
      }
    });

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
                          controller: _scrollViewController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Column(
                                    children: [
                                      EventBlock(),
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
