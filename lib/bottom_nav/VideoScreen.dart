import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:share_plus/share_plus.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../model/CommonModelResponse.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import '../widget/loading.dart';
import '../widget/loading_more.dart';
import '../widget/video_block.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreen createState() => _VideoScreen();
}

class _VideoScreen extends BaseState<VideoScreen> {
  bool _isLoading = false;
  bool isScrollingDown = false;
  late ScrollController _scrollViewController;

  List<CommonModelResponse> listVideoData = [];


  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffFFFFFF), Color(0xffaaa9a3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    super.initState();

    listVideoData.add(CommonModelResponse(video: "https://www.youtube.com/watch?v=OFDfyMUU8Jw", img: "https://www.onmanorama.com/content/dam/mm/en/news/india/images/2023/6/30/rahul-gandhi-pti.jpg.transform/576x300/image.jpg", title: "Rahul Gandhi Manipur Visit"));
    listVideoData.add(CommonModelResponse(video: "https://www.youtube.com/watch?v=WmNxkdnHQ8w", img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgewDtj_0CB0LEmkS_XoYeueOWBJ0NL-NVRWEOm7WiT7_3CaX02s6wbhO3-og-p7PC23M&usqp=CAU", title: "Congress Public Meeting Live"));
    listVideoData.add(CommonModelResponse(video: "https://www.youtube.com/watch?v=u0S_Il-nAZs", img: "https://bsmedia.business-standard.com/_media/bs/img/article/2022-10/28/full/1666970796-5707.jpg", title: "Rahul Gandhi Speech Live: Bharat Jodo Yatra- The Power Of Truth"));

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

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        backgroundColor: screenBg,
        elevation: 0,
        centerTitle: false,
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
                  child: Text(
                    "Videos",
                    style:TextStyle(fontWeight: FontWeight.w600, color: black, fontFamily: gilroy),
                  ),
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
              Expanded(child: Stack(
                children: [
                  AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      controller: _scrollViewController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: listVideoData.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: VideoBlock(listVideoData[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
            ],
          ),
    );
  }


  @override
  void castStatefulWidget() {
    // TODO: implement castStatefulWidget
  }
}