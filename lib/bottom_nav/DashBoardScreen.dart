import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rahul_gandhi_app/bottom_nav/NavigationDrawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import '../../constant/colors.dart';
import '../../constant/global_context.dart';

import '../../utils/app_utils.dart';
import '../../utils/base_class.dart';
import '../../utils/session_manager_methods.dart';
import '../CommonDetailPageScreen.dart';
import '../common_widget/loading.dart';
import '../model/CommonModelResponse.dart';
import '../widget/csr_block.dart';
import '../widget/social_block.dart';
import '../widget/whats_new_block.dart';
import 'NavScreen.dart';
import 'Navigation Screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreen createState() => _DashBoardScreen();
}

class CustomNotification {
  void openDialogForLiveNotification(Map<String, dynamic> data){

    showGeneralDialog(
      context: NavigationService.navigatorKey.currentContext!,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(NavigationService.navigatorKey.currentContext!).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveScreen()));
                },
                child: Card(
                  margin: const EdgeInsets.fromLTRB(12, 50, 12, 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.network(
                                  "https://res.cloudinary.com/dliifke2y/image/upload/v1665053049/gettyimages-136752549-2048x2048_ujbtaf.jpg",
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12,right: 12),
                          child: Text(data['title'] ?? "",
                              style: TextStyle(color: black, fontWeight: FontWeight.w900, fontFamily: gilroy, fontSize: 16)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(orangeNewOne),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0), side: const BorderSide(color: orangeNewOne)))),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const TownHallScreen()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.all(4),
                                  constraints: const BoxConstraints(minWidth: 88.0),
                                  child: const Text('Join', style: TextStyle(color: whiteConst, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: gilroy)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }
}

class _DashBoardScreen extends BaseState<DashBoardScreen> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  bool _isLoading = false;
  bool storyView = false;
  bool whatsNew = false;
  bool quickLink = false;
  bool socialMedia = false;
  bool leaderShip = false;
  bool events = false;
  bool csr = false;
  bool photo = false;
  bool news = false;
  bool video = false;
  bool chairmanMessage = false;
  bool leaderShipDesk = false;
  bool suggestions = false;
  bool isSearch = false;

  final controller = PageController(viewportFraction: 1, keepPage: true);
  final controllerNew = PageController(viewportFraction: 1, keepPage: true);
  final controllerSocial = PageController(viewportFraction: 1, keepPage: true);
  final controllerCSR = PageController(viewportFraction: 1, keepPage: true);
  final controllerEvents = PageController(viewportFraction: 1, keepPage: true);
  final controllerNews = PageController(viewportFraction: 1, keepPage: true);


  int isClicked = 1;
  bool isNotification = false;
  bool isJoining = false;
  bool isPromotion = false;
  bool isAnniversary = false;
  bool isAnimationVisible = false;
  AnimationController? _animationController;
  String profilePic = "";

  List<CommonModelResponse> listData = [];
  List<CommonModelResponse> listEvenData = [];
  List<CommonModelResponse> listEmpowerData = [];
  List<CommonModelResponse> listSocialData = [];
  List<CommonModelResponse> listVideoData = [];
  List<CommonModelResponse> listMediaData = [];



  @override
  void initState() {
    storyView = SessionManagerMethods.getBool("storyView")!;
    whatsNew = SessionManagerMethods.getBool("whatsNew")!;
    quickLink = SessionManagerMethods.getBool("quickLink")!;
    socialMedia = SessionManagerMethods.getBool("socialMedia")!;
    leaderShip = SessionManagerMethods.getBool("leaderShip")!;
    events = SessionManagerMethods.getBool("events")!;
    csr = SessionManagerMethods.getBool("csr")!;
    photo = SessionManagerMethods.getBool("photo")!;
    news = SessionManagerMethods.getBool("news")!;
    video = SessionManagerMethods.getBool("video")!;
    chairmanMessage = SessionManagerMethods.getBool("chairmanMessage")!;
    suggestions = SessionManagerMethods.getBool("suggestions")!;
    leaderShipDesk = SessionManagerMethods.getBool("leaderShipDesk")!;

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animationController?.addStatusListener((animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        setState(() {
          isAnimationVisible = false;
        });
      }
    });
    profilePic = sessionManager.getImagePic().toString();

    listData.add(CommonModelResponse(date:"June 30, 2023" ,description:"Rahul Gandhi's visit to Manipur will not bring any solution to the tense situation of the state and is only a one-day media hype" ,
      img:   "https://res.cloudinary.com/dliifke2y/image/upload/v1665053049/gettyimages-136752549-2048x2048_ujbtaf.jpg",
      place:"Manipur" ,title: "Rahul Gandhi to visit Manipur with healing touch",));

    listData.add(CommonModelResponse(date:"April 03, 2023" ,description:"Congress leader and ex-MP, Rahul Gandhi is likely to visit Gujarat on Monday (April 3, 2023) as an appeal is expected to be moved in the sessions court there against his conviction and two-year sentence in 'Modi surname' defamation case. Gandhi will file a plea against the Surat court's verdict in the defamation case. " ,
      img:   "https://resize.indiatvnews.com/en/resize/newbucket/730_-/2023/04/rahul-gandhi-1680413950.jpg",
      place:"Gujarat" ,title: "Congress Won't Join Any Opposition Bloc Having KCR's Party",));

    listData.add(CommonModelResponse(date:"May 31, 2023" ,description:"Mr. Gandhi was speaking at the 'Mohabbat Ki Dukaan' event organised by Indian Overseas Congress USA in Santa Clara on May 30 when some people from the audience started raising slogans against him and the Gandhi family in connection with the 1984 anti-Sikh riots." ,
      img:   "https://th-i.thgim.com/public/incoming/4drdi2/article66915285.ece/alternates/LANDSCAPE_1200/20230531029L.jpg",
      place:"California" ,title: "Khalistani supporters heckle Rahul Gandhi at an event in U.S.",));

    listData.add(CommonModelResponse(date:"June 22, 2023" ,description:"Rahul Gandhi's visit to Manipur will not bring any solution to the tense situation of the state and is only a one-day media hype" ,
      img:   "https://static.toiimg.com/thumb/msid-101179691,imgsize-23954,width-400,resizemode-4/101179691.jpg",
      place:"Manipur" ,title: "RaGa to address Cong workers at Sadaqat Ashram",));




    listEvenData.add(CommonModelResponse(img: "https://images.indianexpress.com/2023/05/Rahul-Gandhi-US-Visit.jpg?w=640" ,
    title: "Embarking on 3-city US tour, Rahul Gandhi’s packed itinerary: Stanford University talk to NRI, media events", date: "Delhi | May 25, 2023 ",
    description: "Senior Congress leader Rahul Gandhi will embark on a six-day, three-city tour of the United States on May 30 during which he will have interactions with the NRI community, business leaders and media persons. He will have a range of such engagements in San Francisco, Washington DC and New York But a last minute legal hurdle is giving anxious moments to the Congress. On Friday, a Delhi court is set to give its ruling on Rahul’s plea seeking a no-objection certificate (NOC) for issuance of an “ordinary passport” to him after he surrendered his diplomatic passport following his disqualification as an MP."));

    listEvenData.add(CommonModelResponse(img: "https://www.hindustantimes.com/ht-img/img/2023/04/01/550x309/Congress-leader-Rahul-Gandhi---PTI-_1678221324375_1680326471083_1680326471083.jpg" ,
      title: "Rahul Gandhi’s event postponed to April 9 coinciding with PM Modi’s programme in Karnataka ", date: "New Delhi | Jul 03, 2023 ",
    description: "Rahul Gandhi will be in Kolar on April 9 and address the Jai Bharat Mega Rally there. On April 11, he will visit Wayanad. He is the voice of the people, you can never silence him. This voice will only get louder and stronger tweeted Congress general secretary KC Venugopal on Friday.Notably, the election rally will be the first such public meeting of Rahul Gandhi after he was disqualified as a member of Lok Sabha."));

    listEvenData.add(CommonModelResponse(img: "https://th-i.thgim.com/public/incoming/4drdi2/article66915285.ece/alternates/LANDSCAPE_1200/20230531029L.jpg" ,
    title: "Khalistani supporters heckle Rahul Gandhi at an event in U.S.", date: "California | May 31, 2023 ",
    description: "nteracts with the Indian diaspora in San Francisco, California, on May 31. | Photo Credit: ANI Congress leader Rahul Gandhi was heckled by a group of Khalistani supporters who raised slogans against him and briefly interrupted his speech during an event, in Santa Clara in the U.S. state of California Mr. Gandhi was speaking at the 'Mohabbat Ki Dukaan' event organised by Indian Overseas Congress USA in Santa Clara on May 30 when some people from the audience started raising slogans against him and the Gandhi family in connection with the 1984 anti-Sikh riots."));


    listEmpowerData.add(CommonModelResponse(img: "https://images.indianexpress.com/2023/01/PHOTO-2023-01-16-08-54-35.jpg?w=640", title: " Punjab leg of Rahul Gandhi’s yatra focuses on women empowerment", place: "Jalandhar",
    description: "As Congress leader Rahul Gandhi’s Bharat Jodo Yatra entered its fifth day in Punjab on Monday, hundreds of women including MGNREGA workers and Accredited Social Health Activists (ASHAs) walked with him. The yatra was dedicated to the cause of women empowerment for the day."));

    listEmpowerData.add(CommonModelResponse(img: "https://img.etimg.com/thumb/msid-97198988,width-300,height-225,imgsize-1122668,,resizemode-75/bjp-rss-capturing-all-institutions-in-country-rahul-gandhi.jpg", title: "Rahul lauds Wayanad on becoming first Indian district to digitise tribals' documents ", place: "Delhi",
        description: "Congress leader Rahul Gandhi on Saturday congratulated Kerala's Wayanad on becoming India's first district to digitise basic documents of all tribals. An empowered tribal community is the cornerstone of a strong India,Rahul, who represents Wayanad in Lok Sabha, wrote on Twitter."));

    listEmpowerData.add(CommonModelResponse(img: "https://img.etimg.com/thumb/msid-23111596,width-300,height-225,imgsize-80059,,resizemode-75/.jpg", title: " Congress is committed to empower the common man", place: "",
        description: "Congress Vice President Rahul Gandhi on Thursday asserted that his party is common man-centric and committed to empower them while the Opposition believes that one or two leaders can govern a country. Addressing a gathering at the Adivasi Adhikar Sammelan at Jagdalpur in naxal-infested Bastar,Gandhi,attacking the BJP said that there are two political philosophies prevailing in India."));

    listSocialData.add(CommonModelResponse(img: "https://c.ndtvimg.com/2023-06/mha31jfk_rahul-gandhi-1200_625x300_27_June_23.jpg", date: "July 01, 2023", title: "Complainant Seeks Admission Of Rahul Gandhi Tweets In RSS Defamation Case"));
    listSocialData.add(CommonModelResponse(img: "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202304/rahulgandhi456-sixteen_nine.jpeg?VersionId=ZBgla89Zw3HH5fYuukNxYovfxvE8vHSi&size=690:388", date: "Apr 03, 2023," , title: "Rahul Gandhi's tweet after appearing in Surat Sessions Court"));
    listSocialData.add(CommonModelResponse(img: "https://c.ndtvimg.com/2021-08/v2soapbo_rahul-gandhi_650x400_13_August_21.jpg", date: "Sep 06, 2021" , title: "Rahul Gandhi's Tweet Supporting Farmers' Protest"));
    listSocialData.add(CommonModelResponse(img: "https://static.abplive.com/wp-content/uploads/2020/05/06223653/rahul-gandhi.jpg?impolicy=abp_cdn&imwidth=720", date: "May 14, 2020" , title: "'We Will Take Your Voice To The Govt': Rahul Gandhi Tweets Heart-Wrenching Video Of Hapless Migrant Labourers"));

    listVideoData.add(CommonModelResponse(img: "https://images.hindustantimes.com/img/2022/09/30/550x309/ANI-20220924228-0_1664512474692_1664512474692_1664512611175_1664512611175.jpg",));
    listVideoData.add(CommonModelResponse(img: "https://im.rediff.com/news/2023/mar/24rahul-gandhi4.jpg?w=670&h=900",));
    listVideoData.add(CommonModelResponse(img: "https://images.hindustantimes.com/img/2022/08/05/550x309/Rahul_gandhi_at_price_rise_gst_presser_1659678147598_1659678147848_1659678147848.jpg",));

    listMediaData.add(CommonModelResponse(img: "https://ichef.bbci.co.uk/news/976/cpsprodpb/16270/production/_129963709_gettyimages-1258358125-594x594.jpg.webp", date: "June 3, 2023", title: "Rahul Gandhi in US: Why Indian politicians woo the diaspora",
    description: "The Indian diaspora might not have turned up in thousands like they do for Prime Minister Narendra Modi. But, for a politician who is no longer a member of parliament, nor the leader of the opposition, volunteers of the Indian Overseas Congress - Congress party's international chapter - managed enough people to fill the audience for Mr Gandhi's events."));
    listMediaData.add(CommonModelResponse(img: "https://static.theprint.in/wp-content/uploads/2023/06/Untitled-design-58-3.jpg", date: "June 29, 2023", title: "Rahul Gandhi lands in violence-hit Manipur, ‘PM should learn from him,’ says Congress",
        description: "He will visit relief camps and meet people displaced by the ethnic clashes, and will also hold talks with civil society organisations. This is the first visit of the Congress leader to the northeastern state since violence broke out on 3 May between hill-based Kuki tribes and valley-based Meitei non-tribals State Congress leader Kh Debabrata said Gandhi will visit relief camps in Churachandpur and Moirang on Thursday. On Friday, he will visit two more camps and meet party leaders in capital Imphal."));
    listMediaData.add(CommonModelResponse(img: "https://c.ndtvimg.com/2023-06/mha31jfk_rahul-gandhi-1200_625x300_27_June_23.jpg", date: " Jun 30, 2023", title: "Rahul Gandhi's visit to Manipur is for media coverage: Assam CM",
        description: "After Congress leader Rahul Gandhi was stopped from visiting Manipur’s Churachandpur by road, Assam CM Himanta Biswa Sarma said that Rahul's trip is just a one-day media coverage. He added, [The] situation in Manipur demands bridging differences through compassion. It’s not in [the] nation’s interest for a political leader to use his so-called visit to exacerbate fault lines."));


    isHomeReload = false;
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }


  void birthdayNotification(){
    setState(() {
      if (isNotification) {
        isNotification = false;
        return;
      }
      isNotification = true;
      isJoining = false;
      isPromotion = false;
      isAnniversary = false;
      isAnimationVisible = true;
      _animationController?.reset();
      _animationController?.duration = const Duration(seconds: 3);
      _animationController?.forward();
    });
  }

  void profileDialog() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: white,
      barrierColor: black.withOpacity(0.3),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, updateState) {
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
                        color: orangeNewOne,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                      ),
                      Container(
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
                                    child: Image.asset("assets/images/ic_profile_tab.png", height: 30, width: 30),
                                  )),
                              Text('My Profile'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                                    child: Image.asset("assets/images/ic_fav_nav_new.png", height: 30, width: 30),
                                  )),
                              Text('Favourites'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                                    child: Image.asset("assets/images/saved.png", height: 30, width: 30),
                                  )),
                              Text('Saved'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          updateState((){
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
                                    width: 38,
                                    height: 38,
                                    margin: const EdgeInsets.only(right: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset("assets/images/ic_setting_nav_new.png", height: 30, width: 30),
                                    )),
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
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: isSearch ? 100 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                          child: Image.asset("assets/images/ic_dashboard_settings.png", height: 30, width: 30),
                                        )),
                                    Text('Dashboard'.toUpperCase(), style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500)),
                                  ],
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: NavigationService.navigatorKeyHome,
      backgroundColor: white,
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        titleSpacing: 12,
        leading: DescribedFeatureOverlay(
          featureId: 'id1', // Unique id that identifies this overlay.
          tapTarget: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: black,width: 1)
            ),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/ic_user_profile.png',
                height: 36,
                width: 36,
                fit: BoxFit.cover,
              ),
            ),
          ), // The widget that will be displayed as the tap target.
          title: const Text('Navigation And Dashboard Settings'),
          description: const Text('To change navigation and add widget to screen open this settings.'),
          backgroundColor: orangeNewOne.withOpacity(0.7),
          targetColor: white,
          textColor: Colors.white,
          child: GestureDetector(
            onTap: () async {
              HapticFeedback.vibrate();
              Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationDrawerScreen()),);
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: lightGrayNew,width: 1)
              ),
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(left: 8),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  HapticFeedback.vibrate();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NavScreen()),);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: sessionManager.getImagePic().toString().isEmpty
                      ? Image.asset(
                    'assets/images/ic_user_profile.png',
                    height: 42,
                    width: 42,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    profilePic,
                    height: 42,
                    width: 42,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("RG Speaks",style: TextStyle(color: blueNew,fontSize: 18,fontWeight: FontWeight.w600),),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPostScreen()));
              },
              child: Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                child: Image.asset('assets/images/search.png', height: 32, width: 32, color: black),
              ),
            ),
          ],
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  height: 0.5,
                  color: text_dark,
                  thickness: 0.5,
                ))),
        centerTitle: false,
        elevation: 0,
        backgroundColor: white,
      ),
      body: GestureDetector(
        onDoubleTap: () {

        },
        child: _isLoading
            ? const LoadingWidget()
            : SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: isNotification ? 1 : 0,
                        child: Container(
                          height: isNotification ? 220 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              //color: lightGray.withOpacity(0.2),
                              gradient: const LinearGradient(
                                colors: [navigationGradient1, navigationGradient2, navigationGradient3],
                                stops: [0.0, 0.4, 1.0],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )),
                          margin: EdgeInsets.fromLTRB(12, isNotification ? 12 : 0, 12, 0),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dear Pratiksha Panchal, ",
                                      style: const TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    const Text(
                                      "Wishing you a very happy birthday & splendid year ahead.",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w400, fontSize: 18, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 22,
                                    ),
                                    const Text(
                                      "Rahul Gandhi",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Image.asset(
                                    "assets/images/ic_naveen_wish.png",
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: isJoining ? 1 : 0,
                        child: Container(
                          height: isJoining ? 255 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              //color: blueNew,
                              gradient: const LinearGradient(
                                colors: [navigationGradient1, navigationGradient2, navigationGradient3],
                                stops: [0.0, 0.4, 1.0],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )),
                          margin: EdgeInsets.fromLTRB(12, isJoining ? 12 : 0, 12, 0),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Dear Pratiksha Panchal, ",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    const Text(
                                      "Welcome to the JSP Family I am sure you will add great value to the organization with your hardwork and commitment",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w400, fontSize: 18, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 22,
                                    ),
                                    const Text(
                                      "Rahul Gandhi",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Image.asset(
                                    "assets/images/ic_naveen_wish.png",
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: isPromotion ? 1 : 0,
                        child: Container(
                          height: isPromotion ? 280 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              //color: yellowNew,
                              gradient: const LinearGradient(
                                colors: [navigationGradient1, navigationGradient2, navigationGradient3],
                                stops: [0.0, 0.4, 1.0],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          margin: EdgeInsets.fromLTRB(12, isPromotion ? 12 : 0, 12, 0),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Dear Pratiksha Panchal, ",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    const Text(
                                      "Congratulations on your promotion which is the result of your hardwork and commitment, I hope you scale new heights in the future.",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w400, fontSize: 18, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 22,
                                    ),
                                    const Text(
                                      "Rahul Gandhi",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Image.asset(
                                    "assets/images/ic_naveen_wish.png",
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: isAnniversary ? 1 : 0,
                        child: Container(
                          height: isAnniversary ? 280 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              //color: orangeNew,
                              gradient: const LinearGradient(
                                colors: [navigationGradient1, navigationGradient2, navigationGradient3],
                                stops: [0.0, 0.4, 1.0],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          margin: EdgeInsets.fromLTRB(12, isAnniversary ? 12 : 0, 12, 0),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Dear Pratiksha Panchal, ",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    const Text(
                                      "Congratulations on completion of 2 successful year with JSP, I hope you will achieve new heights with same hardwork and commitment.",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w400, fontSize: 18, fontFamily: gilroy),
                                    ),
                                    Container(
                                      height: 22,
                                    ),
                                    const Text(
                                      "Rahul Gandhi",
                                      style: TextStyle(color: blackConst, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: gilroy),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Image.asset(
                                    "assets/images/ic_naveen_wish.png",
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: storyView,
                        child: Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              // const Gap(12),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    TouchRippleEffect(
                                      borderRadius: BorderRadius.circular(18),
                                      rippleColor: Colors.white60,
                                      rippleDuration: const Duration(milliseconds: 100),
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutJSPLScreen()));
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: border, width: 2),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: CircleAvatar(
                                            radius: 48,
                                            backgroundImage: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgyscUUTE5JRATut4NyA_H02hk4_3OiShe6w&usqp=CAU"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Text(
                                      "About JSP",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: black, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              // const Gap(6),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    TouchRippleEffect(
                                      borderRadius: BorderRadius.circular(18),
                                      rippleColor: Colors.white60,
                                      rippleDuration: const Duration(milliseconds: 100),
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: border, width: 2),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: CircleAvatar(
                                            radius: 48,
                                            backgroundImage: NetworkImage(
                                                "https://res.cloudinary.com/dliifke2y/image/upload/v1669291685/Naveen%20Jindal/_SAM9274_jxcxzj.jpg"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 8,
                                    ),
                                    Text(
                                      "Chairman's Space",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: black, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              // const Gap(6),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const SocialWallScreen()));
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: border, width: 2),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: CircleAvatar(
                                            radius: 48,
                                            backgroundImage: NetworkImage(
                                                "https://d2lptvt2jijg6f.cloudfront.net/Flag%20Foundation/page/1598931776_lapal-pin.jpg"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 10,
                                      ),
                                      Text(
                                        "Social Media",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: black, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // const Gap(6),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const MediaCoverageScreen()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: border, width: 2),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          radius: 48,
                                          backgroundImage: NetworkImage(
                                              "https://res.cloudinary.com/dliifke2y/image/upload/v1669291963/Naveen%20Jindal/0X4A0431-min_ospsox.jpg"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Text(
                                      "Media Coverage",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: black, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              // const Gap(6),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const MagazineListScreen()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: border, width: 2),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          radius: 48,
                                          backgroundImage: NetworkImage(
                                              "https://res.cloudinary.com/dliifke2y/image/upload/v1669291685/Naveen%20Jindal/_SAM9274_jxcxzj.jpg"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Text(
                                      "Magazine",
                                      style: TextStyle(color: black, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              // const Gap(6),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const LeadershipScreen()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: border, width: 2),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          radius: 48,
                                          backgroundImage: NetworkImage(
                                              "https://res.cloudinary.com/dliifke2y/image/upload/v1669291684/Naveen%20Jindal/_SAM9259_ydo7fg.jpg"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Text(
                                      "Our Leadership",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: black, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), // story
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: storyView ? 15 : 20),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "WHAT'S NEW",
                              style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: () async {

                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //WhatsNew
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom:20, left: 0, right: 0),
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: PageView.builder(
                          controller: controllerNew,
                          itemCount: listData.length,
                          pageSnapping: true,
                          padEnds: false,
                          physics: const ScrollPhysics(),
                          onPageChanged: (value){
                          },
                          itemBuilder: (context, index) {
                            return WhatsNewBlock(listData[index]);
                          },
                        ),
                      ), //WhatsNew
                      Wrap(
                        children: [
                          Container(
                            width: double.parse((5 * 40).toString()),
                            color: lightGrayNew,
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: controllerNew,
                              count: 5,
                              effect: const SlideEffect(
                                dotHeight: 3,
                                dotWidth: 40,
                                activeDotColor: orangeNewOne,
                                dotColor: lightGrayNew,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(color: grayBg, borderRadius: BorderRadius.circular(0)),
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("LEADERSHIP DESK",
                              // "Rahul is scheduled to go to Manipur on Thursday and return to Manipur on Thursday and return the next day. During the stay, he will visit the Imphal valley as well as the hil ",
                              style: TextStyle(fontFamily: gilroy, fontSize: 18, color: black, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(top: 30, bottom: 30),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  radius: 48,
                                  backgroundImage: NetworkImage("https://res.cloudinary.com/dliifke2y/image/upload/v1665038522/ic_rahulgandhi4_jizmdr.png"),
                                ),
                              ),
                            ),

                            Center(
                              child: Text("Gandhi was born in Delhi on 19 June 1970, as the first of the two"
                                  " children of Rajiv Gandhi, who later became the prime minister of India, and Italian-born Sonia Gandhi (née Maino), who later became the president of Indian National "
                                  "Congress, and as the grandson of Prime Minister Indira Gandhi.",textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: gilroy, fontSize: 14, color: black, fontWeight: FontWeight.w400, )),
                            )

                          ],
                        ),
                      ), //Leadership Desk
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'EVENTS & ENGAGEMENT',
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const EventListScreen()));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //Events
                      Container(
                          margin: const EdgeInsets.only(top: 22,bottom: 22),
                          height: 320,
                          child: PageView.builder(
                            controller: controllerEvents,
                            itemCount: listEvenData.length,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(listEvenData[index])));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 15, right: 15,),
                                  alignment: Alignment.bottomLeft,
                                  height: 320,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                     listEvenData[index].img.toString(),
                                        width: MediaQuery.of(context).size.width,
                                        height: 320,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        height: 320,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            gradient: LinearGradient(
                                                begin: FractionalOffset.topCenter,
                                                end: FractionalOffset.bottomCenter,
                                                colors: [
                                                  blackConst.withOpacity(0.0),
                                                  blackConst.withOpacity(1),
                                                ],
                                                stops: const [
                                                  0.7,
                                                  1.0
                                                ]
                                            ),
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                                            child: Text(
                                              listEvenData[index].title.toString(),
                                              style: const TextStyle(
                                                  color: whiteConst,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: gilroy,
                                                  fontSize: titleFontSize,
                                                  overflow: TextOverflow.ellipsis
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                /*decoration: BoxDecoration(color: orangeNewOne, borderRadius: BorderRadius.circular(20)),*/
                                                margin: const EdgeInsets.fromLTRB(0, 0, 12, 6),
                                                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      listEvenData[index].date.toString(),
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: gilroy,
                                                        fontWeight: FontWeight.w400,
                                                        color: whiteConst,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),

                                                    Text(
                                                      " ",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: gilroy,
                                                        fontWeight: FontWeight.w400,
                                                        color: whiteConst,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Spacer()
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                      ), //Events
                      Wrap(
                        children: [
                          Container(
                            width: double.parse((40 * 4).toString()),
                            color: lightGrayNew,
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: controllerEvents,
                              count: 5,
                              effect: const SlideEffect(
                                dotHeight: 3,
                                dotWidth: 40,
                                activeDotColor: orangeNewOne,
                                dotColor: lightGrayNew,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'EMPOWERING COMMUNITIES',
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const CSRListScreen()));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //CSR
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: 380,
                          child: PageView.builder(
                            itemCount: listEmpowerData.length,
                            controller: controllerCSR,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(listEmpowerData[index])));
                                  },
                                  child: CSRBlock(listEmpowerData[index])
                              );
                            },
                          )
                      ),//CSR
                      Wrap(
                        children: [
                          Container(
                            width: 5 * 40,
                            alignment: Alignment.center,
                            color: lightGrayNew,
                            margin: const EdgeInsets.only(top: 20),
                            child: SmoothPageIndicator(
                              controller: controllerCSR,
                              count: 5,
                              effect: const SlideEffect(
                                dotHeight: 3,
                                dotWidth: 40,
                                activeDotColor: orangeNewOne,
                                dotColor: lightGrayNew,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),//CSR
                      Visibility(
                        visible: false,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(12, 22, 12, 0),
                          height: 200,
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "QUICK LINKS",
                                style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600),
                              ),
                              Container(height: 12),
                              Wrap(
                                spacing: 6.0,
                                runSpacing: 0.0,
                                children: <Widget>[
                                  _buildChip('Foundation'),
                                  _buildChip('Magazine'),
                                  _buildChip('Jindal Panther'),
                                  _buildChip('News'),
                                  _buildChip('Education'),
                                  _buildChip('Media'),
                                  _buildChip('Investment'),
                                  _buildChip('Safety'),
                                  _buildChip('Blogs'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ), //quickLink
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'SOCIAL MEDIA',
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const SocialWallScreen()));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //social media
                      Container(
                          margin: const EdgeInsets.only(top: 15),
                          height: 430,
                          child: PageView.builder(
                            controller: controllerSocial,
                            itemCount: listSocialData.length,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(listSocialData[index])));
                                  // },
                                  child: SocialBlock(listSocialData[index])
                              );
                            },
                          )
                      ), //social media
                      Wrap(
                        children: [
                          Container(
                            width: double.parse((40 * 4).toString()),
                            color: lightGrayNew,
                            margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: controllerSocial,
                              count: 5,
                              effect: const SlideEffect(
                                dotHeight: 3,
                                dotWidth: 40,
                                activeDotColor: orangeNewOne,
                                dotColor: lightGrayNew,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),//social media
                     /* Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 14, right: 14, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'LEADERSHIP CORNER',
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const LeadershipScreen()));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //Leadership
                      Container(
                        height: 250,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only( top: 22),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: () async {
                                      // detailsPageIntent(context,setState,listLeadership,index);
                                    },
                                    child: Container(
                                        height: 230,
                                        width: 160,
                                        margin: const EdgeInsets.only(left: 6,right: 6),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              "https://images.hindustantimes.com/img/2022/08/05/550x309/Rahul_gandhi_at_price_rise_gst_presser_1659678147598_1659678147848_1659678147848.jpg",
                                              width: 160,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.only(top: 4, bottom: 4),
                                                child: Text(
                                                  "Rahul Gandhi",
                                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy, color: black),
                                                  overflow: TextOverflow.clip,
                                                )
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ), //Leadership  */
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 14, right: 14, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'PHOTOS',
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                final BottomNavigationBar bar = bottomWidgetKey.currentWidget as BottomNavigationBar;
                                bar.onTap!(2);
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //photo
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 12, right: 12, top: 22),
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {

                                    },
                                    child: Image.network(
                                     "https://res.cloudinary.com/dliifke2y/image/upload/v1665054169/gettyimages-1071160188-612x612_wpoupi.jpg",
                                      fit: BoxFit.cover,
                                      height: 250,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(left: 2),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {

                                          },
                                          child: Image.network(
                                            "https://res.cloudinary.com/dliifke2y/image/upload/v1665054169/gettyimages-107693272-612x612_yiwevv.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {

                                          },
                                          child: Image.network(
                                            "https://res.cloudinary.com/dliifke2y/image/upload/v1665053049/gettyimages-136752549-2048x2048_ujbtaf.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ), //photo
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Media Coverage'.toUpperCase(),
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const MediaCoverageScreen()));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //news
                      Container(
                          margin: const EdgeInsets.only( top: 22,bottom: 22),
                          height: 300,
                          child: PageView.builder(
                            itemCount: listMediaData.length,
                            controller: controllerNews,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(listMediaData[index])));
                                },
                                child: Card(
                                  elevation: 0,
                                  margin: const EdgeInsets.only(left: 15,),
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  color: grayBg,
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              listMediaData[index].img.toString(),
                                              width: MediaQuery.of(context).size.width,
                                              height: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(12, 22, 12, 0),
                                          child: Text(
                                            listMediaData[index].title.toString(),
                                            style: TextStyle(
                                                height: 1.5,
                                                color: black,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: gilroy,
                                                fontSize: titleFontSize,
                                                overflow: TextOverflow.ellipsis
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                listMediaData[index].date.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: gilroy,
                                                  fontWeight: FontWeight.w400,
                                                  color: black,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                      ), //news
                      Wrap(
                        children: [
                          Container(
                            width: 160,
                            color: lightGrayNew,
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: controllerNews,
                              count: 5,
                              effect: const SlideEffect(
                                dotHeight: 3,
                                dotWidth: 40,
                                activeDotColor: orangeNewOne,
                                dotColor: lightGrayNew,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: false,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const SuggestionFormScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: orangeNewOne),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Share your suggestions with us",
                                  style: TextStyle(color: whiteConst, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: gilroy),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteConst,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                      ), //suggestions
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'VIDEOS',
                                      style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w600)
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                final BottomNavigationBar bar = bottomWidgetKey.currentWidget as BottomNavigationBar;
                                bar.onTap!(2);
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "see all",
                                    style: TextStyle(color: text_dark, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: gilroy),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: text_dark,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ), //Videos
                      Container(
                        height: 175,
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 22),
                        child: GridView.builder(
                          itemCount: listVideoData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 170, crossAxisSpacing: 12, mainAxisSpacing: 12),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                // detailsPageIntent(context,setState,listVideos,index);
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 170,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        listVideoData[index].img.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 12,
                                      right: 12,
                                      child: Image.asset(
                                        "assets/images/play.png",
                                        height: 36,
                                        width: 36,
                                        color: black,
                                      )
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ), //

                      Container(height: 66,),
                      // const Gap(100)
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      labelPadding: const EdgeInsets.all(2.0),
      label: Text(
        label,
        style: const TextStyle(color: orangeNewOne, fontFamily: gilroy, fontSize: 12, fontWeight: FontWeight.w500),
      ),
      backgroundColor: lightGrayNew,
      elevation: 0,
      shadowColor: lightGrayNew,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
    );
  }

  @override
  void castStatefulWidget() {
    widget as DashBoardScreen;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void login(String msg) {
    showSnackBar("sss", context);
  }




}