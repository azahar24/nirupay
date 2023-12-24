import 'package:flutter/material.dart';
import 'package:online_mobile_banking_system/ui/views/dashbord/page/tansaction/in.dart';
import 'package:online_mobile_banking_system/ui/views/dashbord/page/tansaction/out.dart';

import '../../../../const/app_colors.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        
        child: Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          appBar: AppBar(
            backgroundColor: AppColors.crystalblueColor,
            bottom: TabBar(
              tabs: [
                Tab(text: 'In',),
                Tab(text: 'Out',),
                
              ],
            ),
            title: Text('Transaction'),
          ),
          body: TabBarView(
            children: [
              In(),
              Out()
              
              
            ],
          ),
        ),
      );

    
  }
}
