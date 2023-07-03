import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rahul_gandhi_app/common_widget/common_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/colors.dart';
import '../utils/base_class.dart';

class NavigationDrawerScreen extends StatefulWidget {
   NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends BaseState<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            title: Padding(
              padding:  const EdgeInsets.only(top: 0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: appBarIcon(),
                  ),
                  /*GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color:  Color(0xFF8c8bb1),
                          ),
                          color:  Color(0xFF8c8bb1),
                          borderRadius:  BorderRadius.all(Radius.circular(14))),
                      padding:  EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/ic_back.png',
                        color: black,
                        height: 12,
                        width: 12,
                      ),
                    ),
                  ),*/
                   const Spacer(),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding:  const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/ic_notificaiton.png',
                        color: black,
                        height: 22,
                        width: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: false,
            elevation: 0,
            backgroundColor: white,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.transparent,
                        width: 0
                    ),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/rh.jpg"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Container(height: 22,),
                Stack(
                  children: [
                    Container(
                      margin:  const EdgeInsets.only(left: 12, right: 12, bottom: 70),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2.0,
                          ),
                        ],
                        border: Border.all(width: 0.5),
                        color: white,
                        borderRadius:const BorderRadius.all(Radius.circular(12),) ,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_home.png", width: 22, height: 22, color: black),
                              title:  Text('About Rahul Gandhi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),

                            ),
                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_key_issues.png", width: 22, height: 22, color: black),
                              title:  Text('Key Issues', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),

                            ),
                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_speech.png", width: 22, height: 22, color: black),
                              title:  Text('Speeches', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_gallery_nav.png", width: 22, height: 22, color: black),
                              title:  Text('Gallery', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),

                            ),
                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          ListTile(
                            leading: Image.asset("assets/images/ic_support.png", width: 22, height: 22, color: black),
                            title:  Text('Become a Volunteer', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),

                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_merchandies.png", width: 22, height: 22, color: black),
                              title:  Text('Merchandise', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),

                            ),
                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              leading: Image.asset("assets/images/ic_logout.png", width: 22, height: 22, color: black),
                              title:  Text('Logout', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),

                            ),
                          ),
                           Divider(
                            color: black,
                            thickness: 1,
                            endIndent: 22,
                            indent: 22,
                          ),
                          Container(
                            margin:  const EdgeInsets.only(top: 12, bottom: 32),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  padding:  const EdgeInsets.all(12.0),
                                  child: Image.asset("assets/images/ic_instagram.png", width: 22, height: 22, color: black),
                                ),
                              ),
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
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  padding:  const EdgeInsets.all(12.0),
                                  child: Image.asset("assets/images/ic_facebook.png", width: 22, height: 22, color: black),
                                ),
                              ),
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
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  padding:  const EdgeInsets.all(12.0),
                                  child: Image.asset("assets/images/ic_twitter.png", width: 22, height: 22, color: black),
                                ),
                              ),
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
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  padding:  const EdgeInsets.all(12.0),
                                  child: Image.asset("assets/images/ic_youtube.png", width: 22, height: 22, color: black),
                                ),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 100,
                              width: 100,
                              child: Image.asset('assets/images/ic_logo.png', width: 100, height: 100),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.pop(context);
          return Future.value(true);
        });
  }

  @override
  void castStatefulWidget() {
    widget is NavigationDrawerScreen;
  }
}
