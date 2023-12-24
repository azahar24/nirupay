import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:online_mobile_banking_system/business_logics/page_controller.dart';

import 'package:online_mobile_banking_system/ui/views/dashbord/page/acccount.dart';
import 'package:online_mobile_banking_system/ui/views/dashbord/page/history.dart';
import 'package:online_mobile_banking_system/ui/views/dashbord/page/main_home_page.dart';
import 'package:online_mobile_banking_system/ui/views/dashbord/page/transaction.dart';

class BootomNavCon extends StatefulWidget {
  @override
  State<BootomNavCon> createState() => _BootomNavConState();
}

class _BootomNavConState extends State<BootomNavCon> {
  var min = Get.put(StaticPageController());

  @override
  void initState() {

    min.resetTimer();
    

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    min.timer?.cancel();
    super.dispose();
  }

  final _pages = [
    HomePage(),
    HistoryPage(),
    TransactionPage(),
    AccountPage(),
  ];

  int _currntinx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF3F3D9B),
        unselectedItemColor: Color(0xFFA898F6),
        backgroundColor: Color(0xFF161730),
        selectedIconTheme: IconThemeData(size: 40.r),
        unselectedIconTheme: IconThemeData(size: 20.r),
        currentIndex: _currntinx,
        onTap: (int index) {
          setState(() {
            _currntinx = index;
            min.resetTimer();

            
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              fit: BoxFit.cover,
            ),
            label: "Home",
            backgroundColor: Color(0xFF161730),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/history.svg',
              fit: BoxFit.cover,
            ),
            label: "Statistic",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/payment.svg',
              fit: BoxFit.cover,
            ),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/account.svg',
              fit: BoxFit.cover,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: _pages[_currntinx],
    );
  }
}
