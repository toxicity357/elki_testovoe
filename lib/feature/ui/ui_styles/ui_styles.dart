import 'package:elki_testovoe/feature/ui/ui_styles/ui_colors.dart';
import 'package:flutter/widgets.dart';

abstract class UIStyles {
  static const robotoFamily = 'Roboto';

  static TextStyle w700s19blck({Color color = UIColors.black}) => TextStyle(
        fontFamily: robotoFamily,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 19,
      );

  static TextStyle w700s19gr({Color color = UIColors.grey}) => TextStyle(
        fontFamily: robotoFamily,
        overflow: TextOverflow.ellipsis,
        color: color,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 19,
      );

  static TextStyle w700s19wht({Color color = UIColors.white}) => TextStyle(
        fontFamily: robotoFamily,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 19,
      );

  static TextStyle w400s10blck({Color color = UIColors.black}) => TextStyle(
        fontFamily: robotoFamily,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 10,
      );

  static TextStyle w400s14blck({Color color = UIColors.black}) => TextStyle(
        fontFamily: robotoFamily,
        color: color,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      );

  static TextStyle w400s14wht({Color color = UIColors.white}) => TextStyle(
        fontFamily: robotoFamily,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      );
}
