import 'package:flutter/material.dart';
import 'package:stack_smart_home/utils/color.dart';

extension StyleExt on TextStyle {
  TextStyle get size10 => copyWith(fontSize: 10);

  TextStyle get size12 => copyWith(fontSize: 12);

  TextStyle get size14 => copyWith(fontSize: 14);

  TextStyle get size16 => copyWith(fontSize: 16);

  TextStyle get size18 => copyWith(fontSize: 18);

  TextStyle get size20 => copyWith(fontSize: 20);

  TextStyle get size22 => copyWith(fontSize: 22);

  TextStyle get size24 => copyWith(fontSize: 24);

  TextStyle get size26 => copyWith(fontSize: 26);

  TextStyle get size28 => copyWith(fontSize: 28);

  TextStyle get size32 => copyWith(fontSize: 32);

  TextStyle get size30 => copyWith(fontSize: 30);

  TextStyle get size36 => copyWith(fontSize: 36);

  TextStyle get colorWhite => copyWith(color: Colors.white);

  TextStyle get primaryColor => copyWith(color: BrandColor.primaryColor);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

const regular = TextStyle(
  color: BrandColor.white,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

const bold = TextStyle(
  color: BrandColor.white,
  fontSize: 14,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);
