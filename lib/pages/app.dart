import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomVanigationBarWidget(),
    );
  }

  Widget _bottomVanigationBarWidget() {
    return BottomNavigationBar(
      items: [
        _bottomNavigationBarItem('home', '홈'),
        _bottomNavigationBarItem('notes', '동네생활'),
        _bottomNavigationBarItem('location', '내 근처'),
        _bottomNavigationBarItem('chat', '채팅'),
        _bottomNavigationBarItem('user', '나의 당근'),
      ],
      onTap: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/${iconName}_off.svg', width: 20),
      label: label,
    );
  }


  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
        break;
    }
    return Container();
  }
}
