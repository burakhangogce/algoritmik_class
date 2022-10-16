import 'dart:developer';

import 'package:algoritmik_class/business/commons/utils/second_icon_font.dart';
import 'package:algoritmik_class/business/commons/widgets/buttons/main_button_group.dart';
import 'package:algoritmik_class/business/commons/widgets/duo_tone_font_awesome_icon.dart';
import 'package:algoritmik_class/business/commons/widgets/font_awesome_icon.dart';
import 'package:algoritmik_class/constants/app_color.dart';
import 'package:algoritmik_class/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../commons/utils/icon_font.dart';

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

  final DateFormat format1 = DateFormat('MMMM');
  var buttons = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hoşgeldin",
                      style: AppTheme.notoSansMed14PrimaryText,
                    ),
                    Text(
                      "Burakhan Gögce",
                      style: AppTheme.notoSansSB18PrimaryText,
                    ),
                  ],
                ),
                DuoToneFontAwesomeIcon(
                    iconSource: IconFont.bell,
                    firstColor: const Color.fromARGB(255, 35, 30, 30),
                    iconSize: 24,
                    secondColor: primaryColor2,
                    iconSecondSource: SecondIconFont.bell),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 228, 228, 228),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        DuoToneFontAwesomeIcon(
                            iconSource: IconFont.usersclass,
                            firstColor: const Color.fromARGB(255, 35, 30, 30),
                            iconSize: 24,
                            secondColor: primaryColor2,
                            iconSecondSource: SecondIconFont.usersclass),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Sinifim",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        DuoToneFontAwesomeIcon(
                            iconSource: IconFont.rulertriangle,
                            firstColor: const Color.fromARGB(255, 35, 30, 30),
                            iconSize: 24,
                            secondColor: primaryColor2,
                            iconSecondSource: SecondIconFont.rulertriangle),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Ödev",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        DuoToneFontAwesomeIcon(
                            iconSource: IconFont.analytics,
                            firstColor: const Color.fromARGB(255, 35, 30, 30),
                            iconSize: 24,
                            secondColor: primaryColor2,
                            iconSecondSource: SecondIconFont.analytics),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Performans",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        DuoToneFontAwesomeIcon(
                            iconSource: IconFont.books,
                            firstColor: const Color.fromARGB(255, 35, 30, 30),
                            iconSize: 24,
                            secondColor: primaryColor2,
                            iconSecondSource: SecondIconFont.books),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Rapor",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MainButtonGroup(
                buttons: [],
                spacing: 2,
                onchanged: (int index) {
                  log(index.toString());
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bugün, ${format1.format(DateTime.now())} ${DateTime.now().day}",
                  style: AppTheme.notoSansMed14PrimaryText
                      .copyWith(color: insideFormTextColor),
                ),
                const Spacer(),
                Text(
                  "Hepsini Gör",
                  style: AppTheme.notoSansMed14PrimaryText
                      .copyWith(color: primaryTextColor),
                ),
                DuoToneFontAwesomeIcon(
                    iconSource: IconFont.chevronright,
                    firstColor: const Color.fromARGB(255, 35, 30, 30),
                    iconSize: 12,
                    secondColor: const Color.fromARGB(255, 35, 30, 30),
                    iconSecondSource: SecondIconFont.chevronright),
              ],
            )
          ],
        ),
      ),
    );
  }
}
