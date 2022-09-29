import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/blue_info.png"),
          Text("Gain total control of your money"),
          SizedBox(
            height: 17,
          ),
          Text("Become your own money manager and make every cent count"),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [],
          ),
          SizedBox(
            height: 33,
          ),
          Row(),
          SizedBox(
            height: 12,
          ),
          Row(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
