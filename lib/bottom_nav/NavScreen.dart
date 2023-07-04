import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/colors.dart';
import '../utils/app_utils.dart';
import '../utils/base_class.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreen createState() => _NavScreen();
}

class _NavScreen extends BaseState<NavScreen> {

  String version = '';
  String profilePic = '';

  @override
  void initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: navigationTopBg,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark,
    ));

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: navigationTopBg,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: navigationTopBg,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          backgroundColor: white,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Container(
                height: 210,
                decoration: const BoxDecoration(
                  color: navigationTopBg,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30)),
                ),
                child: Stack(
                  children: [
                    // Container(
                    //   color: navigationTopBg,
                    //   margin: const EdgeInsets.only(left: 40),
                    //   child: Image.asset("assets/images/congress_logo.jpeg", height: 210, width: double.infinity,),
                    // ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 10,left: 25),
                      // child: Image.asset("assets/images/ic_nav_logo.png", height: 130, width: 130),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfileScreen()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                               Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      "Rahul Gandhi",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 20, color: blackConst, fontWeight: FontWeight.w600, fontFamily: gilroy),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,

                              child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 20,bottom: 10),
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: grayNew,width: 1)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(52),
                                    child: sessionManager.getImagePic().toString().isEmpty
                                        ? Image.asset(
                                      "assets/images/rh.jpg",
                                      width: 72,
                                      height: 72,
                                      fit: BoxFit.cover,)
                                        : Image.network(profilePic, width: 72,
                                        height: 72,
                                        fit: BoxFit.cover),
                                  )
                              ),
                            )
                          ],
                        )
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context, isHomeReload);
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(6),
                                child: Image.asset('assets/images/ic_back_button.png', height: 22, width: 22,color: black),
                              )
                          ),
                          const Spacer(),
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              // onTap: () {
                              //   profileDialog();
                              // },
                              child: Image.asset("assets/images/ic_dot_new_navigation.png", height: 20, width: 20, color: blackConst)
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12,right: 12),
                  child: navigationItem(context),
                ),
              ),
              Container(width: 6),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 6),
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
                margin: const EdgeInsets.only(bottom: 10,left: 20,right: 10, top: 10),
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
                              var url = Uri.parse("https://www.facebook.com/rahulgandhi/");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                print('There was a problem to open the url: $url');
                              }
                            },
                            child: Image.asset(
                              "assets/images/ic_fb_new_navigation.png",
                              height: 22,
                              width: 22,
                              color: black,
                            ),
                          ),
                          Container(width: 15),
                          GestureDetector(
                            onTap: () async {
                              var url = Uri.parse("https://www.instagram.com/rahulgandhi/?hl=en");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                print('There was a problem to open the url: $url');
                              }
                            },
                            child: Image.asset(
                              "assets/images/ic_ig_new_navigation.png",
                              height: 22,
                              width: 22,
                              color: black,
                            ),
                          ),
                          Container(width: 15),
                          GestureDetector(
                            onTap: () async {
                              var url = Uri.parse("https://twitter.com/rahulgandhi");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                print('There was a problem to open the url: $url');
                              }
                            },
                            child: Image.asset(
                              "assets/images/ic_twitter_new_navigation.png",
                              height: 22,
                              width: 22,
                              color: black,
                            ),
                          ),
                           Container(width: 15),
                          GestureDetector(
                            onTap: () async {
                              var url = Uri.parse("https://www.youtube.com/c/rahulgandhi");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                print('There was a problem to open the url: $url');
                              }
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text("App Version : $version",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: gilroy,color: black,fontSize: 12),),
              //   ],
              // ),

              Container(height: 16),

            ],
          ),
        ),
        onWillPop: () {
          Navigator.pop(context, isHomeReload);
          return Future.value(true);
        }
    );
  }

  void profileDialog() {
    bool isSearch = false;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: white,
      barrierColor: black.withOpacity(0.3),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12,right: 12,top: 15),
                  decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)), color: white),
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
                        onTap: () async {
                          Navigator.pop(context);
                          // var value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfileScreen()));
                          setState((){});
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 12),
                                    child: Image.asset("assets/images/ic_profile_tab.png", height: 26, width: 26)),
                                Text('My Profile'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const Gap(6),
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
                                    margin: const EdgeInsets.only(right: 12),
                                    child: Image.asset("assets/images/ic_fav_nav_new.png", height: 26, width: 26)),
                                Text('Favourites'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const Gap(6),
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
                                    margin: const EdgeInsets.only(right: 12),
                                    child: Image.asset("assets/images/saved.png", height: 26, width: 26)),
                                Text('Saved'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const Gap(6),

                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState((){
                            isSearch = !isSearch;
                          });
                          print("isClicked");
                        },
                        child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 12),
                                    child: Image.asset("assets/images/ic_setting_nav_new.png", height: 26, width: 26)),
                                Text('Settings'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                                const Spacer(),
                                isSearch
                                    ? Icon(Icons.keyboard_arrow_up_sharp,color: black,size: 22,)
                                    : Icon(Icons.keyboard_arrow_down_sharp,color: black,size: 22,)
                              ],
                            ),
                          ),
                        ),
                      ),
                       Container(width: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: isSearch ? 100 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                          margin: const EdgeInsets.only(right: 12),
                                          child: Image.asset("assets/images/ic_dashboard_settings.png", height: 26, width: 26)),
                                      Text('Dashboard'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  void castStatefulWidget() {
    widget is NavScreen;
  }
}
