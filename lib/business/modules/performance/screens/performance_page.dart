import 'package:algoritmik_class/business/modules/performance/screens/performance_add_first.dart';
import 'package:algoritmik_class/business/modules/performance/screens/performance_add_second.dart';
import 'package:algoritmik_class/business/modules/performance/screens/performance_add_third.dart';
import 'package:flutter/material.dart';

class HomeWorkPage extends StatefulWidget {
  const HomeWorkPage({Key? key}) : super(key: key);

  @override
  State<HomeWorkPage> createState() => _HomeWorkPageState();
}

class _HomeWorkPageState extends State<HomeWorkPage> {
  PageController _pageController = PageController();
  double index = 0;
  @override
  void initState() {
    _pageController = PageController()..addListener(updateState);
    super.initState();
  }

  void updateState() {
    setState(() {
      index = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(updateState);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            physics: const PageScrollPhysics(),
            children: const [
              PerformanceAddFirst(),
              PerformanceAddSecond(),
              PerformanceAddThird(),
            ],
          ),
        ],
      ),
    );
  }

  void loginFunc() {
    Navigator.pushNamed(context, '/login');
  }
}
