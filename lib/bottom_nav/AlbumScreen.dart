import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../model/GalleryResponseModel.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import '../widget/loading.dart';
import '../widget/loading_more.dart';
import 'GalleryDetailScreen.dart';

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
  List<GalleryResponseModel> listPhotosData = [];


  @override
  void initState() {
    List<Images> listGallery1 = [];
    listGallery1.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4OLHEz3o6lEoX8QzWCOp0NSW_bvr8H195oGEYYttSgN03zjf1l3I0MF0KBoyr8UEnVb0&usqp=CAU" ,description: ""));
    listGallery1.add(Images(img: "https://c.ndtvimg.com/2022-11/peuk7h08_rahul-gandhi_625x300_02_November_22.jpg?ver-20230616.03" , description: ""));
    listGallery1.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6qrTFBI-ACFGjjXBHpGu5pujFFRxO0Bf5BA&usqp=CAU" , description: ""));
    listGallery1.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqmlD40_9p0SlsfzIyoj594273IT93vfeIpEMrye36srv4atIugxuxOb4D2AQtxhr5-fY&usqp=CAU" , description: ""));

    List<Images> listGallery2 = [];
    listGallery2.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkmpnu6KylaNV9k1uwdswgNnEbOcaV3mzeCAHuS-_vR7qIU97WXIjyTCSFW7-34ci9avI&usqp=CAU" ,description: ""));
    listGallery2.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkmpnu6KylaNV9k1uwdswgNnEbOcaV3mzeCAHuS-_vR7qIU97WXIjyTCSFW7-34ci9avI&usqp=CAU" ,description: ""));

    List<Images> listGallery3 = [];
    listGallery3.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaO6FNvCf5gpFcRBxDE9EabjoaI4vi3bQSSSXKIpmxl9c7OJC_P_8yTV0KetmTVVVyRP8&usqp=CAU" ,description: ""));
    listGallery3.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4OLHEz3o6lEoX8QzWCOp0NSW_bvr8H195oGEYYttSgN03zjf1l3I0MF0KBoyr8UEnVb0&usqp=CAU" ,description: ""));
    listGallery3.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_dZTuTKq9IbXMa9lH4TFe6qSoKUNk7VTHkA&usqp=CAU" ,description: ""));

    List<Images> listGallery4 = [];
    listGallery4.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv8-yK74F4PiuoAn7ICcLjizMDHJqRL2UjrweWgXy1uAhQ0ntu7qoyvCrwcPkLRR6gigo&usqp=CAU" ,description: ""));
    listGallery4.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSst64_mmvxb-8r7t0L09v4TNIxlCqBIHvy0BR5UPdqQZmG44Fma3N6RgIu4HlYs03vj88&usqp=CAU" ,description: ""));
    listGallery4.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-UPVVLmoFFTMkyGY9CLw7JntQK7J6ak0F5g&usqp=CAU" ,description: ""));

    List<Images> listGallery5 = [];
    listGallery5.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrCSC9BokGcs3nWDNwplJH8KcYGiB1o_vg7rmRvJDzvUsJIqvxj3X8OvIT8siQpNQ5D7Y&usqp=CAU" ,description: ""));
    listGallery5.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJutaWdulSDgvFdRu3tJzXx5i6jrMb6wftTiij5jB7780y8WiFz8Tv0CAPHsrUZol-IB4&usqp=CAU" ,description: ""));
    listGallery5.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLOSI6GW_CPkKThsTuMagJ3K0reCc4G2Z9tK3HPF6ktn83PktlDkxtoPOBwiQcsrR1Fc&usqp=CAU" ,description: ""));
    listGallery5.add(Images(img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEDaY1ne_siL4twq3vobxCW7GmMCOOEX7F7AYTXm2tUGTf2fYf63a3XXrGJ_mavSmVZIw&usqp=CAU" ,description: ""));

    listPhotosData.add(GalleryResponseModel(img: "https://c.ndtvimg.com/2022-11/peuk7h08_rahul-gandhi_625x300_02_November_22.jpg", images: listGallery1,title: "Plays Drums, Celebrates 'Bonalu' "));
    listPhotosData.add(GalleryResponseModel(img: "https://feeds.abplive.com/onecms/images/uploaded-images/2022/10/17/f86abb95f6976740922d6198cc21cb3d1665976699200120_original.png?impolicy=abp_cdn&imwidth=720",images: listGallery2, title: "Bharat Jodo Yatra"));
    listPhotosData.add(GalleryResponseModel(img: "https://images.newindianexpress.com/uploads/user/imagelibrary/2023/4/23/w900X450/RahulGandhi-Basavanna.JPG?w=900&dpr=1.0",images: listGallery3, title: "'Basava Jayanti' in Karnataka"));
    listPhotosData.add(GalleryResponseModel(img: "https://images.indianexpress.com/2023/07/rahul-gandhi-khammam.jpg?w=640", images: listGallery4, title: "addresses a public meeting, in Khammam district"));
    listPhotosData.add(GalleryResponseModel(img: "https://th-i.thgim.com/public/incoming/rqpjtg/article67034745.ece/alternates/FREE_1200/10215_2_7_2023_18_36_35_1_IMG_20230702_WA0061.JPG", images: listGallery5, title: "visit Andhra Pradesh"));

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
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryDetailScreen(listPhotosData[index])));
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
