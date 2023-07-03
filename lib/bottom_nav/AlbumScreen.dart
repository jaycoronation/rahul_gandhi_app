import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../model/CommonModelResponse.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import '../widget/loading.dart';
import '../widget/loading_more.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreen createState() => _AlbumScreen();
}

class _AlbumScreen extends BaseState<AlbumScreen> {
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _pageIndex = 0;
  final int _pageResult = 15;
  bool _isLastPage = false;
  bool isScrollingDown = false;
  late ScrollController _scrollViewController;
  List<CommonModelResponse> listPhotosData = [];


  @override
  void initState() {
    listPhotosData.add(CommonModelResponse(img: "https://c.ndtvimg.com/2022-11/peuk7h08_rahul-gandhi_625x300_02_November_22.jpg", title: "Plays Drums, Celebrates 'Bonalu' "));
    listPhotosData.add(CommonModelResponse(img: "https://feeds.abplive.com/onecms/images/uploaded-images/2022/10/17/f86abb95f6976740922d6198cc21cb3d1665976699200120_original.png?impolicy=abp_cdn&imwidth=720", title: "Bharat Jodo Yatra"));
    listPhotosData.add(CommonModelResponse(img: "https://images.newindianexpress.com/uploads/user/imagelibrary/2023/4/23/w900X450/RahulGandhi-Basavanna.JPG?w=900&dpr=1.0", title: "'Basava Jayanti' in Karnataka"));
    listPhotosData.add(CommonModelResponse(img: "https://images.indianexpress.com/2023/07/rahul-gandhi-khammam.jpg?w=640", title: "addresses a public meeting, in Khammam district"));
    listPhotosData.add(CommonModelResponse(img: "https://th-i.thgim.com/public/incoming/rqpjtg/article67034745.ece/alternates/FREE_1200/10215_2_7_2023_18_36_35_1_IMG_20230702_WA0061.JPG", title: "visit Andhra Pradesh"));

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

    isGalleryReload= false;
    super.initState();
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
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 65,
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  "Photo Gallery",
                  style:TextStyle(fontWeight: FontWeight.w600, color: black, fontFamily: gilroy),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        backgroundColor: screenBg,
        resizeToAvoidBottomInset: true,
        body: _isLoading
            ? const LoadingWidget()
            : Column(
              children: [
                Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: AnimationLimiter(
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 300, crossAxisSpacing: 2, mainAxisSpacing: 2),
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: listPhotosData.length,
                              controller: _scrollViewController,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: 2,
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryScreen()));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 12),
                                          child: Stack(children: [
                                            Container(
                                              margin: const EdgeInsets.only(left: 4, right: 4),
                                              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                                              height: 300,
                                              width: MediaQuery.of(context).size.width,
                                              child: FadeInImage.assetNetwork(
                                                image: listPhotosData[index].img.toString(),
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context).size.width,
                                                height: 300,
                                                placeholder: 'assets/images/bg_gray.jpeg',
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(left: 4, right: 4),
                                              height: 300,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                                                    blackConst.withOpacity(0.2),
                                                    blackConst.withOpacity(1),
                                                  ], stops: const [
                                                    0.7,
                                                    1.0
                                                  ]),
                                                  borderRadius: BorderRadius.circular(0)),
                                            ),
                                              Positioned(
                                                top: 12,
                                                right: 12,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: white.withOpacity(0.2),
                                                  ),
                                                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/album.png",
                                                        width: 18,
                                                        height: 18,
                                                      ),
                                                      Container(
                                                        width: 6,
                                                      ),
                                                      const Text(
                                                        "",
                                                        style: TextStyle(color: whiteConst, fontSize: 12, fontFamily: gilroy, fontWeight: FontWeight.w400),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Container(
                                                alignment: Alignment.bottomCenter,
                                                margin: const EdgeInsets.only(left: 6, right: 6, top: 14, bottom: 20),
                                                child: Text(
                                                  listPhotosData[index].title.toString(),
                                                  style: TextStyle(
                                                      fontWeight: titleFont,
                                                      fontFamily: gilroy,
                                                      color: whiteConst,
                                                      fontSize: 16,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Visibility(visible : _isLoadingMore,child: const LoadingMoreWidget())
              ],
            )
    );
  }


  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffFFFFFF), Color(0xffaaa9a3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void castStatefulWidget() {
    widget is AlbumScreen;
  }
}
