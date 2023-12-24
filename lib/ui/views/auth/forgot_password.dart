import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../widgets/button.dart';

class ForgotPass extends StatelessWidget {
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
                      'Forgot Password',
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
                  'We need your registration phon number\n to send you password reset code!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 100.h,),
                TextFormField(
                  //controller: ,
                  decoration: AppStyle().textFieldDecoration(
                      'Enter Old Email',),
                ),
                SizedBox(height: 20.h,),
                Button(text: 'Send Code', onAction: (){},)

              ],
            ),
          ),
        ));
  }
}
