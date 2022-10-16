import 'package:algoritmik_class/extensions/color_extension.dart';
import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromRGBO(250, 250, 250, 1);

const Color primaryColor = Color.fromRGBO(127, 61, 255, 1);
MaterialColor primaryMaterialColor = primaryColor.toMaterialColor();

const Color primaryColor2 = Color.fromARGB(255, 162, 127, 234);
MaterialColor primary2MaterialColor = primaryColor.toMaterialColor();

const Color displayWhiteColor = Color.fromRGBO(234, 234, 234, 1);
MaterialColor displayWhiteMaterialColor = displayWhiteColor.toMaterialColor();

const Color secondaryColor = Color.fromRGBO(253, 165, 46, 1);
MaterialColor secondaryMaterialColor = secondaryColor.toMaterialColor();

const Color overlayColor = Color.fromRGBO(7, 61, 145, 1);
MaterialColor overlayMaterialColor = overlayColor.toMaterialColor();

const Color overlayDarkColor = Color.fromRGBO(19, 46, 106, 1);
MaterialColor overlayDarkMaterialColor = overlayColor.toMaterialColor();

const Color disabledColor = Color.fromRGBO(38, 75, 132, 0.56);
MaterialColor disabledMaterialColor = disabledColor.toMaterialColor();

const Color cardColor = Color.fromRGBO(253, 165, 46, 1);
MaterialColor cardMaterialColor = cardColor.toMaterialColor();

const Color primaryTextColor = Color.fromRGBO(30, 41, 59, 1);
MaterialColor primaryTextMaterialColor = primaryTextColor.toMaterialColor();

const Color secondaryTextColor = Color.fromRGBO(255, 255, 255, 1);
MaterialColor secondaryTextMaterialColor = secondaryTextColor.toMaterialColor();

const Color insideFormTextColor = Color.fromRGBO(115, 122, 133, 1);
MaterialColor insideFormTextMaterialColor =
    insideFormTextColor.toMaterialColor();

const Color quaternaryColor = Color.fromRGBO(30, 41, 59, 1);
MaterialColor queternaryMaterialColor = quaternaryColor.toMaterialColor();

const Color errorColor = Color.fromRGBO(238, 91, 92, 1);
MaterialColor errorMaterialColor = errorColor.toMaterialColor();

const Color ghostColor = Color.fromRGBO(241, 245, 249, 1);
MaterialColor ghostMaterialColor = ghostColor.toMaterialColor();

const Color softBorderColor = Color.fromRGBO(214, 222, 231, 1);
MaterialColor softBorderMaterialColor = softBorderColor.toMaterialColor();

const Color cardShadowColor = Color.fromRGBO(170, 170, 170, 0.15);
MaterialColor cardShadowMaterialColor = cardShadowColor.toMaterialColor();

const Color cardBorderColor = Color.fromRGBO(245, 246, 247, 1);
MaterialColor cardBorderMaterialColor = cardBorderColor.toMaterialColor();

const Color officalCardShadowColor = Color.fromRGBO(0, 0, 0, 0.04);
MaterialColor officaCardShadowMaterialColor =
    officalCardShadowColor.toMaterialColor();

const Color officalCardBorderColor = Color.fromRGBO(248, 248, 248, 1);
MaterialColor officalCardBorderMaterialColor =
    officalCardBorderColor.toMaterialColor();

const Color loginGradientStartColor = Color.fromRGBO(19, 46, 106, 1);

const Color containerShadowColor = Color.fromRGBO(232, 232, 232, 0.16);

const Color containerInsideBorder = Color.fromRGBO(226, 233, 240, 1);

const Color filterTextFieldColor = Color.fromRGBO(239, 243, 244, 1);
MaterialColor filterTextFieldColorMaterialColor =
    filterTextFieldColor.toMaterialColor();

LinearGradient gradientBackground = const LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1.1825454235076904),
    colors: [
      loginGradientStartColor,
      Color.fromRGBO(21, 48, 110, 1),
      Color.fromRGBO(10, 23, 53, 1)
    ]);

const Color scanedColor = Color.fromRGBO(148, 238, 91, 1);
MaterialColor scanedColorMaterialColor =
    scanedColorMaterialColor.toMaterialColor();
