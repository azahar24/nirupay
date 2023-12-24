import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const/app_colors.dart';

class PaymantPage extends StatelessWidget {
  int currentIndex = 0;
  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('user-form-data')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('tk')
          .snapshots();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: Padding(
          padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
          //         Row(
          //   children: [
          //     Container(
          //       height: 35.h,
          //       width: 35.w,
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/img/back.png'),
          //             fit: BoxFit.fill),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 60.w,
          //     ),
          //     Text(
          //       'Payments',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 18,
          //           fontWeight: FontWeight.w500),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20.h,
          // ),
          // //appbar
          //  Align(
          //   alignment: Alignment.centerLeft,
          //    child: Text(
          //     'My Card',
          //     style: TextStyle(
          //         fontSize: 18.sp,
          //         fontWeight: FontWeight.w400,
          //         color: Colors.white),
          //                ),
          //  ),
          //  SizedBox(
          //   height: 10.h,
          // ),
          // SingleChildScrollView(
            
          //   scrollDirection: Axis.horizontal,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //               gradient: LinearGradient(
          //                 colors: [
          //                   Color(0xFF3F3D9B),
          //                   Color(0xFF6C6CC9),
          //                 ],
          //               ),
          //               borderRadius: BorderRadius.circular(20)),
          //           height: 170.h,
          //           width: 300.w,
          //           child: Padding(
          //             padding: const EdgeInsets.all(20),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'VISA',
          //                       style: TextStyle(
          //                           fontSize: 16,
          //                           fontWeight: FontWeight.w900,
          //                           color: Colors.white),
          //                     ),
          //                     IconButton(
          //                         onPressed: () {},
          //                         icon: Icon(
          //                           Icons.linear_scale_sharp,
          //                           color: Colors.green,
          //                         ))
          //                   ],
          //                 ),
          //                 Text(
          //                   'CARD NUMBER',
          //                   style: TextStyle(
          //                       fontSize: 9, color: Color(0xFFFEFEFE)),
          //                 ),
          //                 Text(
          //                   '**** **** **** *379',
          //                   style: TextStyle(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white),
          //                 ),
          //                 SizedBox(
          //                   height: 13,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'CARD HOLDER NAME',
          //                       style: TextStyle(
          //                           fontSize: 9, color: Colors.white),
          //                     ),
          //                     Text(
          //                       'EXPIRE DATE',
          //                       style: TextStyle(
          //                           fontSize: 9, color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: 3,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'Precious Ogar',
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white),
          //                     ),
          //                     Text(
          //                       '02/25',
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //               gradient: LinearGradient(
          //                 colors: [
          //                   Color(0xFF3F3D9B),
          //                   Color(0xFF6C6CC9),
          //                 ],
          //               ),
          //               borderRadius: BorderRadius.circular(20)),
          //           height: 170.h,
          //           width: 300.w,
          //           child: Padding(
          //             padding: const EdgeInsets.all(20),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'VISA',
          //                       style: TextStyle(
          //                           fontSize: 16,
          //                           fontWeight: FontWeight.w900,
          //                           color: Colors.white),
          //                     ),
          //                     IconButton(
          //                         onPressed: () {},
          //                         icon: Icon(
          //                           Icons.linear_scale_sharp,
          //                           color: Colors.green,
          //                         ))
          //                   ],
          //                 ),
          //                 Text(
          //                   'CARD NUMBER',
          //                   style: TextStyle(
          //                       fontSize: 9, color: Color(0xFFFEFEFE)),
          //                 ),
          //                 Text(
          //                   '**** **** **** *379',
          //                   style: TextStyle(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white),
          //                 ),
          //                 SizedBox(
          //                   height: 13,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'CARD HOLDER NAME',
          //                       style: TextStyle(
          //                           fontSize: 9, color: Colors.white),
          //                     ),
          //                     Text(
          //                       'EXPIRE DATE',
          //                       style: TextStyle(
          //                           fontSize: 9, color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: 3,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'Precious Ogar',
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white),
          //                     ),
          //                     Text(
          //                       '02/25',
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // //card
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       2,
          //       (index) => buildDot(index, context),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10.h,
          // ),

          // ///dot indicator

                  Container(
                    height: 75,
                    
                    child: Card(
                      color: Color(0xFF6C6CC9),
                      child: ListTile(
                        title: Text(data['name'].toString(),maxLines: 1,style: TextStyle(
                          color: Colors.white,
                        ),),
                        subtitle: Text(data['tk'].toString(),maxLines: 1,style: TextStyle(
                          color: Colors.white,
                        ),),
                        
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
            }),
        ),
      ),
    );
 
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: currentIndex == index ? 18 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0xFF3F3D9B) : Color(0xFF6C6CC9),
      ),
    );
  }
}