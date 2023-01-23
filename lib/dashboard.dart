import 'package:buuilderapp/Pages/bottom_navigation.dart';
import 'package:buuilderapp/Pages/onclick_pages/about_us.dart';
import 'package:buuilderapp/Pages/onclick_pages/contact.dart';
import 'package:buuilderapp/Pages/onclick_pages/home_page.dart';
import 'package:flutter/material.dart';

import 'Pages/onclick_pages/booking.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget>pageList=[
  HomePage(),
  Booking(),
  Contact(),
  AboutUs(),
  ];

  ValueNotifier<int> pageIndex= ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, child) {
          return pageList[pageIndex.value];
        }
      ),
      bottomNavigationBar:BottomNavigation(pageIndex: pageIndex,)
    );
  }
}