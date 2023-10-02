import 'package:flutter/material.dart';
import '../../view_model/home_layout_view_model.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.search_rounded,
            color: Theme.of(context).splashColor,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: HomeLayoutViewModel.bottomNavigationBarIndex,
          items: HomeLayoutViewModel.bottomNavigationBarItems,
          onTap: (index) {
            setState(() {
              HomeLayoutViewModel.bottomNavigationBarIndex = index;
            });
          },
        ),
        body: HomeLayoutViewModel
            .screensBody[HomeLayoutViewModel.bottomNavigationBarIndex]);
  }
}
