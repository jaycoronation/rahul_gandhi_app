import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../common_widget/common_widget.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import '../widget/loading.dart';
import '../widget/loading_more.dart';
import '../widget/social_block.dart';

class SocialWallTabScreen extends StatefulWidget {
  const SocialWallTabScreen({Key? key}) : super(key: key);

  @override
  _SocialWallScreen createState() => _SocialWallScreen();
}

class _SocialWallScreen extends BaseState<SocialWallTabScreen> {
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

    super.initState();
  }



  final Shader linearGradientSocial = const LinearGradient(
    colors: <Color>[Color(0xffFFFFFF), Color(0xff9b9b98)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 800.0, 120.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading: false,
        backgroundColor: screenBg,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              final BottomNavigationBar bar = bottomWidgetKey.currentWidget as BottomNavigationBar;
              bar.onTap!(0);
            },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/images/ic_back_button.png', width: 4, height: 4,color: black,),
          ),
        ),
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
                child: appBarTitle('Social Media'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      backgroundColor: screenBg,
      resizeToAvoidBottomInset: true,
      body: _isLoading
          ? const LoadingWidget()
          : Column(
        children: [
          Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  controller: _scrollViewController,
                  itemCount:5,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SocialBlock(),
                        ),
                      ),
                    );
                  },
                ),
              )
          ),
          Visibility(
              visible: _isLoadingMore,
              child: const LoadingMoreWidget())
        ],
      ),
    );
  }


  @override
  void castStatefulWidget() {
    widget is SocialWallTabScreen;
  }
}
