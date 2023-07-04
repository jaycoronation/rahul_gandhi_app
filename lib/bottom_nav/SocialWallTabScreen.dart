import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../common_widget/common_widget.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../model/CommonModelResponse.dart';
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
  List<CommonModelResponse> listSocialData = [];


  @override
  void initState() {
    listSocialData.add(CommonModelResponse(img: "https://static.abplive.com/wp-content/uploads/2020/05/06223653/rahul-gandhi.jpg?impolicy=abp_cdn&imwidth=720", date: "May 14, 2020" , title: "'We Will Take Your Voice To The Govt': Rahul Gandhi Tweets Heart-Wrenching Video Of Hapless Migrant Labourers",
    description: "Congress leader Rahul Gandhi on Thursday said that his party will raise voices of migrant labourers and ensure they get help as their livelihood was adversely impacted due to coronavirus-induced lockdown. Gandhi, the Lok Sabha MP from Wayanad, posted a heart-wrenching video of labourers on Twitter with a song in the background, urging the government to help them to reach their native places. Darkness is deep and it is a tough time. Have patience we will stand in their security. We will keep raising their voice and will ensure they get every possible help. They are not ordinary people but they are the flag of the country's self-respect. We will never let it bow down, the Congress leader tweeted in Hindi along with the video."));

    listSocialData.add(CommonModelResponse(img: "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202304/rahulgandhi456-sixteen_nine.jpeg?VersionId=ZBgla89Zw3HH5fYuukNxYovfxvE8vHSi&size=690:388", date: "Apr 03, 2023," , title: "Congress president's post represents a set of ideas, beliefs about India: Rahul Gandhi",
    description: "Former Congress president Rahul Gandhi on Thursday said he has made his position clear on whether he will fight the party president elections and refused to elaborate on the matter. On being repeatedly asked about the upcoming party polls during a press conference, Rahul said he has communicated his decision to the party and does not need to do so through the media."));


    listSocialData.add(CommonModelResponse(img: "https://c.ndtvimg.com/2021-08/v2soapbo_rahul-gandhi_650x400_13_August_21.jpg", date: "Sep 06, 2021" , title: "Rahul Gandhi's Tweet Supporting Farmers' Protest",
        description: "A day after thousands of farmers gathered at a mahapanchayat in Uttar Pradesh's Muzaffarnagar, Congress leader Rahul Gandhi on Monday voiced support for the protesting farmers and said they are fearless and standing resolutely."));


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
                  itemCount:listSocialData.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SocialBlock(listSocialData[index]),
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
