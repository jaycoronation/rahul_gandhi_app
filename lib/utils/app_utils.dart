import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rahul_gandhi_app/utils/session_manager.dart';

import '../constant/colors.dart';


/*show message to user*/
showSnackBar(String? message,BuildContext? context) {
  try {
    return ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(message!),
          duration: const Duration(seconds: 1),
        ),
      );
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void noInternetSnackBar(BuildContext? context){
  showSnackBar("Please check your Network Connection", context);
}

showToast(String? message,BuildContext? context){
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: black,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


checkValidString (String? value) {
  if (value == null || value == "null" || value == "<null>")
  {
    value = "";
  }
  return value.trim();
}

/*check email validation*/
bool isValidEmail(String? input) {
  try {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input!);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}
isValidPhoneNumber(String? input)
{
  try {
    return RegExp(r'(0/91)?[7-9][0-9]{9}').hasMatch(input!);
  } catch (e) {
    if(kDebugMode){

      print(e);
    }
    return false;
  }
}


/*convert string to CamelCase*/
toDisplayCase (String str) {
  try {
    return str.toLowerCase().split(' ').map((word) {
        String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
        return word[0].toUpperCase() + leftText;
      }).join(' ');
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

String universalDateConverter(String inputDateFormat,String outputDateFormat, String date) {
  var outputDate = "";
  try {
    var inputFormat = DateFormat(inputDateFormat);
    var inputDate = inputFormat.parse(date);

    var outputFormat = DateFormat(outputDateFormat);
    outputDate = outputFormat.format(inputDate);
    print(outputDate); // 12/31/2000 11:59 PM <-- MM/dd 12H format
  } catch (e) {
  }
  return outputDate;
}

String getPrice(String str) {
  return "€$str";
}


String readTimestamp(int timestamp) {
  var now = new DateTime.now();
  var format = new DateFormat('HH:mm a');
  var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
  var diff = date.difference(now);
  var time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + 'DAY AGO';
    } else {
      time = diff.inDays.toString() + 'DAYS AGO';
    }
  }

  return time;
}

String convertTimetoDateTimestamp(String timestamp, String format) {
  print(timestamp);
  var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  String fdatetime = DateFormat(format).format(date);
  print(fdatetime);

  return fdatetime;
}

String getInitials({required String string, required int limitTo}) {
  var buffer = StringBuffer();
  var split = string.split(' ');
  for (var i = 0; i < (limitTo ?? split.length); i++) {
    buffer.write(split[i][0]);
  }

  return buffer.toString();
}



navigationItem(BuildContext context){
  return SingleChildScrollView(
    child: Column(
      children: [
        // const Gap(25),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutJSPLScreen()));
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Image.asset("assets/images/ic_aboutJSP_new_navigation.png", height: 30, width: 30),
                  // const Gap(15),
                  Text(
                    "About JSP".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Image.asset("assets/images/ic_aboutChairman_new_navigation.png", height: 30, width: 30),
                  // const Gap(15),
                  Text(
                    "Chairman's Space".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const LeadershipScreen()));
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Image.asset("assets/images/ic_our_leadership.png",height: 30, width: 30 ),
                  // const Gap(15),
                  Text(
                    "Leadership Corner".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const CSRListScreen()));
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Image.asset("assets/images/ic_csr.png",height: 30, width: 30),
                  // const Gap(15),
                  Text(
                    "Empowering Communities".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const MediaCoverageScreen()));
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child:  Row(
                children: [
                  Image.asset("assets/images/ic_media_new_navigation.png",height: 30, width: 30),
                  // const Gap(15),
                  Text(
                    "Media Coverage".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const MagazineListScreen()));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child:
              Row(
                children: [
                  Image.asset("assets/images/ic_magazine_new_navigation.png",height: 30, width: 30),
                  // const Gap(15),
                  Text(
                    "Magazine".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const TownHallScreen()));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child:
              Row(
                children: [
                  Image.asset("assets/images/ic_townhall.png",height: 30, width: 30),
                  // const Gap(15),
                  Text(
                    "Town Hall".toUpperCase(),
                    style: TextStyle(fontFamily: gilroy, fontSize: 16, color: black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // const Gap(10),
      ],
    ),
  );
}