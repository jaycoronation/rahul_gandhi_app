
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rahul_gandhi_app/common_widget/common_widget.dart';

import '../constant/colors.dart';

class NavigationScreen extends StatefulWidget {

  const NavigationScreen( {super.key});
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
   return WillPopScope(
       child: Scaffold(
         backgroundColor: white,
         appBar: AppBar(
           elevation: 0,
           backgroundColor: white,
           leading: InkWell(
             onTap: (){
               Navigator.pop(context);
             },
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Image.asset('assets/images/ic_back_button.png', width: 4, height: 4,color: black,),
             ),
           ),
         ),
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(12.0),
             child: Container(
               decoration: BoxDecoration(
                   boxShadow: const [BoxShadow(
                     blurRadius: 2.0,
                   ),],
                 border: Border.all(width: 0.5),
                 borderRadius:const BorderRadius.all(Radius.circular(12),),
                 color: white,
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12,),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                                Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('About Rahul Gandhi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),

                             ],
                           ),
                           Container(height: 14,),
                           Divider(
                             indent: 4,
                             endIndent: 4,
                             thickness: 0.7,
                             height: 2,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Key Issues', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Speeches', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Gallery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Constituency', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),

                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Social Media', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),

                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Become a Volunteer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),

                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Get Personalized Wishes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),

                   Container(height: 20,),
                   Container(
                     margin: const EdgeInsets.only(left: 12, right: 12, ),
                     child: IntrinsicHeight(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Image.asset('assets/images/ic_user_profile.png', height: 38, width: 38),
                               Container(width: 12,),
                               Padding(
                                 padding: EdgeInsets.only(left: 8.0),
                                 child: Text('Merchandise', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),),
                               ),
                             ],
                           ),
                           Divider(
                             indent: 12,
                             endIndent: 12,
                             thickness: 0.5,
                             color: black,
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(height: 20,),
                 ],
               ),
             ),
           ),
         ),
       ),
     onWillPop: (){
       SystemNavigator.pop();
       return Future.value(true);
     },
   );
  }

}