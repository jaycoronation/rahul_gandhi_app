import 'dart:async';
import 'dart:io';
import 'package:dotted_line/dotted_line.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../constant/colors.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';
import 'DashBoardScreen.dart';
import 'EventScreenTab.dart';
import 'MediaScreen.dart';
import 'SocialWallTabScreen.dart';


class BottomNavigationBarScreen extends StatefulWidget {
  final int passIndex ;
  const BottomNavigationBarScreen(this.passIndex, {Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();

}

class _BottomNavigationBarScreenState extends BaseState<BottomNavigationBarScreen> {
  final List<Widget> _pages = List<Widget>.empty(growable: true);
  final List<BottomNavigationBarItem> itemsList= List<BottomNavigationBarItem>.empty(growable: true);
  late int _currentIndex = 0;
  DateTime preBackPressTime = DateTime.now();
  late TabController tabController;
  final GlobalKey<_BottomNavigationBarScreenState> myWidgetState = GlobalKey<_BottomNavigationBarScreenState>();
  bool isDashBoardTab = true;
  bool isMediaTab = false;
  bool isNewsTab = false;
  bool isBlogTab = false;
  bool isEventTab = false;
  bool isMoreTab = false;

  TextEditingController searchController = TextEditingController();

  var screenSize;
  //late int NavigationService.currentIndexWeb = 0;
  String version = '';

  @override
  void initState()
  {
    super.initState();
    if(isDashBoardTab)
    {
      _pages.add(DashBoardScreen(key : myWidgetState));
      itemsList.add(BottomNavigationBarItem(
        icon: Image.asset("assets/images/ic_dashboard_new_navigation.png",width: 22,height: 22,color: black),
        activeIcon: Image.asset("assets/images/ic_dashboard_selected_black.png",
            width: 22,
            height: 22
        ),
        label: 'Dashboard',
      ));
    }

    _pages.add(const EventScreenTab());
    itemsList.add(BottomNavigationBarItem(
      icon: Image.asset("assets/images/ic_event_un_selected.png",width: 22,height: 22,color: black),
      activeIcon: Image.asset("assets/images/ic_event_selected_white.png",width: 22,height: 22),
      label: 'Events',
    ));

    _pages.add(const MediaScreen());
    itemsList.add(BottomNavigationBarItem(
      icon: Image.asset("assets/images/ic_media_un_selected.png",width: 22,height: 22,color: black),
      activeIcon: Image.asset("assets/images/ic_media_selected_white.png",width: 22,height: 22),
      label: 'Gallery',
    ));

    _pages.add(const SocialWallTabScreen());
    itemsList.add(BottomNavigationBarItem(
      icon: Image.asset("assets/images/ic_social_un_selected.png",width: 22,height: 22,color: black),
      activeIcon: Image.asset("assets/images/ic_social_active.png",width: 22,height: 22),
      label: 'Social',
    ));


    /*itemsList.add(BottomNavigationBarItem(
      icon: Image.asset("assets/images/ic_more_un_selected.png",width: 22,height: 22,color: black),
      activeIcon: Image.asset("assets/images/ic_more_selected_black.png",width: 22,height: 22),
      label: 'More',
    ));*/



    if(isMoreTab)
    {
      //_pages.add(const MoreTab());
      itemsList.add(BottomNavigationBarItem(
        icon: Image.asset("assets/images/ic_more_un_selected.png",width: 22,height: 22,color: black),
        activeIcon: Image.asset("assets/images/ic_more_selected_black.png",width: 22,height: 22),
        label: 'More',
      ));
    }

    _currentIndex = (widget as BottomNavigationBarScreen).passIndex;
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
  }


  void profileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Row(
          children: [
            // const Gap(250),
            Expanded(
                child: AlertDialog(
                  content: Wrap(
                    children: [
                      Container(
                        width: 500,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        //   width: ResponsiveWidget.isSmallScreen(context) ? MediaQuery.of(context).size.width : webScreenWidthForDialog,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)), color: white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 2,
                              width: 40,
                              alignment: Alignment.center,
                              color: orange,
                              margin: const EdgeInsets.only(top: 10, bottom: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 38,
                                          height: 38,
                                          margin: const EdgeInsets.only(right: 12),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset("assets/images/ic_aboutChairman_new_navigation.png",
                                               height: 30, width: 30, color: blackConst),
                                          )),
                                      Text('My Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityListScreen("Favourites")));
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                          width: 38,
                                          height: 38,
                                          margin: const EdgeInsets.only(right: 12),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset("assets/images/ic_fav_nav_new.png",height: 30, width: 30, color: blackConst),
                                          )
                                      ),
                                      Text('Favourites', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityListScreen("Saved")));
                              },
                              child: Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 38,
                                          height: 38,
                                          margin: const EdgeInsets.only(right: 12),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset("assets/images/ic_bookmark_nav_new.png",height: 30, width: 30, color: blackConst),
                                          )),
                                      Text('Saved', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                              },
                              child: Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 38,
                                          height: 38,
                                          margin: const EdgeInsets.only(right: 12),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset("assets/images/ic_setting_nav_new.png",height: 30, width: 30, color: blackConst),
                                          )),
                                      Text('Dashboard Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        );
      },
    );
  }

  void _onItemTapped(int value) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }


    if(itemsList[value].label.toString() == "More")
      {
        if (Platform.isAndroid)
        {
          HapticFeedback.vibrate();
        }
        else
        {
          HapticFeedback.lightImpact();
        }

        showSettingMenu();
       /* setState(() {
          _currentIndex = 0;

        });*/
      }
    else if(itemsList[value].label.toString() == "Gallery")
      {
        if (Platform.isAndroid)
        {
          HapticFeedback.vibrate();
        }
        else
          {
            HapticFeedback.lightImpact();
          }
        setState(() {
          _currentIndex = value;
        });

      }
    else
      {
        if (Platform.isAndroid)
          {
            HapticFeedback.vibrate();
          }
        else
        {
          HapticFeedback.lightImpact();
        }

        setState(() {
          _currentIndex = value;
        });

      }

  }


  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return FeatureDiscovery(
      recordStepsInSharedPreferences: true,
      child: WillPopScope(
        onWillPop: () {
          if (_currentIndex != 0)
          {
            setState(() {
              _currentIndex = 0;
            });
            return Future.value(false);
          }
          else
          {
            final timeGap = DateTime.now().difference(preBackPressTime);
            final cantExit = timeGap >= const Duration(seconds: 2);
            preBackPressTime = DateTime.now();
            if (cantExit)
            {
              showSnackBar('Press back button again to exit', context);
              return Future.value(false);
            }
            else
            {
              SystemNavigator.pop();
              return Future.value(true);
            }
          }
        },
        child:Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: white,
          extendBody: true,
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: Material(
            elevation: 6,
            child: Container(
              height: Platform.isAndroid ? 64 : 100,
              color: white,
              padding: const EdgeInsets.only(top: 6,bottom: 0),
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(child: Container()),
                      Expanded(child: Container()),
                      Expanded(child: Container()),
                      Expanded(
                        child: DescribedFeatureOverlay(
                          featureId: 'id2', // Unique id that identifies this overlay.
                          tapTarget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/ic_more_un_selected.png', color: black , height: 24, width: 24),
                              Text("More",style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600,color: black),)
                            ],
                          ), // The widget that will be displayed as the tap target.
                          title: const Text('Sub Tabs'),
                          description: const Text('Select sub tabs and go to perticular screen'),
                          backgroundColor: orangeNewOne.withOpacity(0.7),
                          targetColor: white,
                          textColor: Colors.white,
                          child: GestureDetector(
                            onTap: () async {},
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(left: 8),
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(52),
                                  child: Image.asset(
                                    'assets/images/ic_user_profile.png',
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  BottomNavigationBar(
                    elevation: 0,
                    key: bottomWidgetKey,
                    items : itemsList,
                    selectedItemColor: black,
                    selectedLabelStyle: TextStyle(color: black,fontSize: 12,height :2 ,fontFamily: gilroy,fontWeight: FontWeight.w500),
                    unselectedLabelStyle: TextStyle(color: black,fontSize: 12,height : 2 ,fontFamily: gilroy,fontWeight: FontWeight.w500),
                    backgroundColor: white,
                    unselectedItemColor: text_dark,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    onTap: _onItemTapped,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  void showSettingMenu() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12,top: 15,bottom: 15),
                  child: Wrap(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 40,
                            alignment: Alignment.center,
                            color: orangeNewOne,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                        ],
                      ),
                      navigationItem(context),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: const DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: text_light,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10,top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      // launchCustomTab(context,"https://www.facebook.com/JSPLCorporate/");
                                    },
                                    child: Image.asset(
                                      "assets/images/ic_fb_new_navigation.png",
                                      height: 22,
                                      width: 22,
                                      color: black,
                                    ),
                                  ),
                                  Container(width: 15,),
                                  GestureDetector(
                                    onTap: () async {
                                      // launchCustomTab(context,"https://instagram.com/jsplcorporate?igshid=YmMyMTA2M2Y=");
                                    },
                                    child: Image.asset(
                                      "assets/images/ic_ig_new_navigation.png",
                                      height: 22,
                                      width: 22,
                                      color: black,
                                    ),
                                  ),
                                  Container(width: 15,),
                                  GestureDetector(
                                    onTap: () async {
                                      // launchCustomTab(context,"https://twitter.com/jsplcorporate?lang=en");
                                    },
                                    child: Image.asset(
                                      "assets/images/ic_twitter_new_navigation.png",
                                      height: 22,
                                      width: 22,
                                      color: black,
                                    ),
                                  ),
                                  Container(width: 15,),
                                  GestureDetector(
                                    onTap: () async {
                                      // launchCustomTab(context,"https://www.youtube.com/@JSPLCorporate");
                                    },
                                    child: Image.asset(
                                      "assets/images/ic_youtube_new_navigation.png",
                                      height: 22,
                                      width: 22,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // logoutFromApp(context);
                                },
                                child: Image.asset(
                                  "assets/images/ic_logout_new_navigation.png",
                                  height: 22,
                                  width: 22,
                                  color: black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("App Version : $version",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: gilroy,color: black,fontSize: 12),),
                        ],
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  @override
  void castStatefulWidget() {
    widget is BottomNavigationBarScreen;
  }
}
