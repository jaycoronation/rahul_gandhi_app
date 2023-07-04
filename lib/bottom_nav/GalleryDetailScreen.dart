import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:rahul_gandhi_app/utils/full_screen_image.dart';
import '../constant/api_end_point.dart';
import '../constant/colors.dart';
import '../model/GalleryResponseModel.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import '../widget/loading.dart';
import '../widget/loading_more.dart';

class GalleryDetailScreen extends StatefulWidget {
  final GalleryResponseModel getSet;

  const GalleryDetailScreen(this.getSet, {Key? key, }) : super(key: key);

  @override
  _GalleryDetailScreen createState() => _GalleryDetailScreen();
}

class _GalleryDetailScreen extends BaseState<GalleryDetailScreen> {
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _pageIndex = 0;
  final int _pageResult = 15;
  bool _isLastPage = false;
  bool isScrollingDown = false;
  late ScrollController _scrollViewController;
  GalleryResponseModel getSet = GalleryResponseModel();

  @override
  void initState(){
    getSet = (widget as GalleryDetailScreen).getSet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
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
        ),
        backgroundColor: screenBg,
        resizeToAvoidBottomInset: true,
        body: _isLoading
            ? const LoadingWidget()
            : Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: AnimationLimiter(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 300, crossAxisSpacing: 2, mainAxisSpacing: 2),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: getSet.images?.length,
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
                              List<String> listGallery = [];
                              for (var i=0 ; i < getSet.images!.length; i++ )
                                {
                                  listGallery.add(getSet.images![i].img.toString());
                                }
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenImage(getSet.images![index].img.toString(),listGallery,index)));
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
                                    image: getSet.images![index].img.toString(),
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
    );
  }


  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffFFFFFF), Color(0xffaaa9a3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void castStatefulWidget() {
    widget is GalleryDetailScreen;
  }
}
