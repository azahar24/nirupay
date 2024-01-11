import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:online_mobile_banking_system/ui/route/route.dart';

class BillPayDb{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void billPay(var number, int amount,var date) async {
    try {
      CollectionReference _course =
          FirebaseFirestore.instance.collection('user-form-data');

          _course.doc(_auth.currentUser!.email).collection('transaction_out').doc().set({
        'tk': amount,
        'name': number,
        'date': date,
        'sendtype': 'Bill'
      }).whenComplete(
        () async {},
      );

      _course.doc(_auth.currentUser!.email).collection('tk').doc().set({
        'tk': -amount,
        'name': number,
        'date': date,
      }).whenComplete(
        () async {
          Fluttertoast.showToast(msg: 'Payment Successful');
          Get.toNamed(homeScreen);
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: 'error: $e');
    }

  }
  
}