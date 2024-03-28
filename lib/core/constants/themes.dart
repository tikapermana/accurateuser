import 'package:flutter/material.dart';

class AppColors {
  static Color themeRed = const Color.fromRGBO(245, 0, 87, 1);
}

class AppSizing {
  double minSpacing = 4.0;
  double defaultSpacing = 8.0;
  double biggerSpacing = 12.0;
  double extraSpacing = 16.0;
  double veryExtraSpacing = 30.0;
}

class AppThemes {
  int minAnimationDuration = 300;
  int standAnimationDuration = 500;

  ThemeData onCardTheme({required BuildContext context}){
    return Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        primaryColor: Colors.black
    );
  }

  BoxShadow onSetDefaultShadow() {
    return BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 10,
        spreadRadius: 0.8,
        offset: const Offset(0, 2));
  }

  BoxShadow onSetExtraShadow() {
    return BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 12,
        spreadRadius: 1.2,
        offset: const Offset(1.5, 4));
  }

  BorderRadius onSetRadiusMin() {
    return BorderRadius.circular(AppSizing().minSpacing);
  }

  BorderRadius onSetRadiusDefault() {
    return BorderRadius.circular(AppSizing().defaultSpacing);
  }

  VerticalDivider onSetDivider() {
    return VerticalDivider(
      width: 2.0,
      color: Colors.grey.shade200,
      thickness: 0.8,
      indent: 0.0,
      endIndent: 0.0,
    );
  }
}

class AppAnimation{
  fadeTrans(Widget child, Animation<double> animation){
    return FadeTransition(
      child: child,
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutQuad,
      ),
    );
  }

  sizeTrans(Widget child, Animation<double> animation){
    return SizeTransition(
      child: child,
      sizeFactor: animation,
    );
  }

  slideTrans(Widget child, Animation<double> animation){
    return SlideTransition(
      child: child,
      position: Tween<Offset>(
          begin: const Offset(0, -2), end: const Offset(0, 0)
      ).animate(
          CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubic
          )
      ),
    );
  }
}

class AppText{

  TextStyle textHeader3BoldWordSpacing({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 18.72,
      fontWeight: FontWeight.w500,
      letterSpacing: 4.0,
      wordSpacing: 7.0,
    );
    return text;
  }

  TextStyle textHeader1Bold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeader2Bold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeader3Bold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 18.72,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeader4Bold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeaderMid({required Color color}) {
    TextStyle text =
    TextStyle(color: color, fontSize: 14, );
    return text;
  }

  TextStyle textHeaderMidBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeader5Bold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 13.28,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeader6Bold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        );
    return text;
  }

  TextStyle textHeader1Thin({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w300,
        );
    return text;
  }

  TextStyle textHeader2Thin({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w300,
        );
    return text;
  }

  TextStyle textHeader3Thin({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 18.72,
        fontWeight: FontWeight.w300,
        );
    return text;
  }

  TextStyle textHeader4Thin({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.w300,
        );
    return text;
  }

  TextStyle textHeader5Thin({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 13.5,
        fontWeight: FontWeight.w300,
        );
    return text;
  }

  TextStyle textHeader6Thin({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w300,
        );
    return text;
  }

  TextStyle textHeader1({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 32,
    );
    return text;
  }

  TextStyle textHeader2({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 24,
    );
    return text;
  }

  TextStyle textHeader3({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 18.72,
    );
    return text;
  }

  TextStyle textHeader4({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 16,
    );
    return text;
  }

  TextStyle textHeader5({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 13.28,
        
    );
    return text;
  }

  TextStyle textHeader6({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 12,
    );
    return text;
  }

  TextStyle textHeaderSmall({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 9,
    );
    return text;
  }

  TextStyle textHeader1ExtraBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        );
    return text;
  }

  TextStyle textHeader2ExtraBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        );
    return text;
  }

  TextStyle textHeader3ExtraBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 18.72,
        fontWeight: FontWeight.w700,
        );
    return text;
  }

  TextStyle textHeader4ExtraBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        );
    return text;
  }

  TextStyle textHeader5ExtraBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 13.28,
        fontWeight: FontWeight.w700,
        );
    return text;
  }

  TextStyle textHeader6ExtraBold({required Color color}) {
    TextStyle text = TextStyle(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        );
    return text;
  }

  TextStyle textHeaderMidBoldSpacing({required Color color}) {
    TextStyle text = TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
    );
    return text;
  }
}