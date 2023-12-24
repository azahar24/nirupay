import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_mobile_banking_system/ui/route/route.dart';
import 'package:online_mobile_banking_system/ui/styles/style.dart';
import 'package:online_mobile_banking_system/ui/widgets/button.dart';


class PinLock extends StatefulWidget {
  @override
  State<PinLock> createState() => _PinLockState();
}

class _PinLockState extends State<PinLock> {
  final _formKey = GlobalKey<FormState>();
  final box = GetStorage();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  TextEditingController _pinController = TextEditingController();

  

  late String _oldPin;

  @override
  void initState() {
    
    try {
      var userId = box.read('uid');


      FirebaseFirestore.instance
          .collection('user-form-data')
          .doc(_auth.currentUser!.email)
          .get()
          .then((value) {
        setState(() {
          _oldPin = value.data()!['pin'];
        });
      });
    } catch (err) {
      print(err.runtimeType);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF161730),
      body: Padding(
        padding: EdgeInsets.only(top: 25.h, right: 15.w, left: 15.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(loginSignUpScreen),
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/back.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      'Let’s Unlock',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                
                
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _pinController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "this field can't be empty";
                    } else if (val.length < 5) {
                      return "Minimum 5 Digit Pin";
                    } else {
                      return null;
                    }
                  },
                
                  decoration: AppStyle().textFieldDecoration(
                      'Enter Pin',),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 32.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'Forget Pin',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFF030303),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Button(text: 'Submit', onAction: (){
                  print(_oldPin);                   
                        int _pin = int.parse(_pinController.text);
                        print(_pin);
                        int _oldpinlast = int.parse(_oldPin);
                        print(_oldpinlast);
                        var output = (_oldpinlast == _pin) ? Get.toNamed(homeScreen) : Fluttertoast.showToast(msg: 'wrong Pin',textColor: Colors.red);
                        print(output);
                }),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(
                          text: "Don’t have registered yet? ",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA898F6),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(signUpScreen),
                        )
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
