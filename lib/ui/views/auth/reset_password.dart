import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../widgets/button.dart';

class ResetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF161730),
      body: Padding(
        padding: EdgeInsets.only(top: 25.h, right: 15.w, left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/back.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Enter a new password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 100.h,),
            TextFormField(
              //controller: ,
              keyboardType: TextInputType.visiblePassword,
              decoration: AppStyle().textFieldDecoration(
                  'New Password', Icons.visibility_off_outlined),
            ),
            SizedBox(height: 20.h,),
            TextFormField(
              //controller: ,
              keyboardType: TextInputType.visiblePassword,
              decoration: AppStyle().textFieldDecoration(
                  'Confirm Password', Icons.visibility_off_outlined),
            ),
            SizedBox(height: 30.h,),
            Button(text: 'Confirm', onAction: (){},)

          ],
        ),
      ),
    ));
  }
}
