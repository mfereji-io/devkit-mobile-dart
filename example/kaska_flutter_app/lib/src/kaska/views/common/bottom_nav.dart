import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

BottomNavigationBar getBottomNavbar(BuildContext context, TabsRouter tabsRouter){
  
  final BottomNavigationBar bottomNavBar;

  final bottomNavItems = <BottomNavigationBarItem>[

    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/img/bottom_nav/01_a.png',
        height: 32,
        width: 32,
      ),
      activeIcon: Image.asset(
        'assets/img/bottom_nav/01_b.png',
        height: 32,
        width: 32,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/img/bottom_nav/02_a.png',
        height: 32,
        width: 32,
      ),
      activeIcon: Image.asset(
        'assets/img/bottom_nav/02_b.png',
        height: 32,
        width: 32,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/img/bottom_nav/03_a.png',
        height: 32,
        width: 32,
      ),
      activeIcon: Image.asset(
        'assets/img/bottom_nav/03_b.png',
        height: 32,
        width: 32,
      ),
      label: '',
    ),

  ];
  
   bottomNavBar = BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    iconSize: 24,
    currentIndex: tabsRouter.activeIndex,
    items: bottomNavItems,
    onTap: (x){ if(x<bottomNavItems.length){tabsRouter.setActiveIndex(x);} },
  );

  return bottomNavBar;

}