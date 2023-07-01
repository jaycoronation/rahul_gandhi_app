import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:slide_indexed_stack/slide_indexed_stack.dart';
import '../common_widget/common_widget.dart';
import '../constant/colors.dart';
import '../constant/global_context.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import 'AlbumScreen.dart';
import 'VideoScreen.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  _MediaScreen createState() => _MediaScreen();
}

class _MediaScreen extends BaseState<MediaScreen> with SingleTickerProviderStateMixin {


  late TabController _tabController;

  @override
  void initState() {
    _tabController =  TabController(length: 2, vsync: this);
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
          // leading: InkWell(
          //     onTap: () {
          //       final BottomNavigationBar bar = bottomWidgetKey.currentWidget as BottomNavigationBar;
          //       bar.onTap!(0);
          //     },
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Image.asset('assets/images/ic_back_button.png', width: 4, height: 4,color: black,),
          //   ),
          // ),
          titleSpacing: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 65,
                margin: const EdgeInsets.only(left: 5),
                child: appBarTitle('Gallery'),
              ),
              const Spacer(),
            ],
          )
      ),
      backgroundColor: screenBg,
      resizeToAvoidBottomInset: true,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                pinned: false,
                snap: false,
                toolbarHeight: 56,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                centerTitle: false,
                flexibleSpace: AppBar(
                    toolbarHeight: 55,
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
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 65,
                          margin: const EdgeInsets.only(left: 5),
                          child: appBarTitle('Gallery'),
                        ),
                        const Spacer(),
                      ],
                    )
                ),
              ),
              SliverAppBar(
                elevation: 0,
                floating: true,
                pinned: true,
                snap: true,
                automaticallyImplyLeading: false,
                toolbarHeight: 60,
                backgroundColor: Colors.white,
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12,right: 12),
                      decoration: BoxDecoration(
                          color: lightGrayNew,
                          borderRadius: BorderRadius.circular(6.0)
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                            color: orangeNewOne,
                            borderRadius:  BorderRadius.circular(6.0)
                        ) ,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: whiteConst,
                            fontFamily: gilroy
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black,
                            fontFamily: gilroy
                        ),
                        tabs:  const [
                          Tab(text: 'Videos', height: 40),
                          Tab(text: 'Photos',height: 40),
                        ],
                      ),
                    ),
                     Container(height:10),
                  ],
                ),
              ),
            ];
          },
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.down,
          controller: _tabController,
          children: const [
            VideoScreen(),
            AlbumScreen(),
          ],
        ),
      ),
    );
  }

  @override
  void castStatefulWidget() {
    widget is MediaScreen;
  }
}
