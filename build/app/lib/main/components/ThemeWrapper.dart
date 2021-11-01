import 'package:flutter/widgets.dart';
import '../classes/core.dart';

class StyleThemeData {
  final String themeName;
  static StyleThemeData basic;
  final Color c1;
  final Color c2;
  final Color c3;
  final Color c4;
  final Color c5;
  final Color c6;
  final Color c7;
  final Color c8;
  final Color c9;
  final Color c10;
  final Color c11;
  final Color c12;
  final Color c13;
  final Color c14;
  final Color c15;
  final Color c16;
  final Color c17;
  final Color c18;
  final Color c19;
  final Color c20;
  static StyleThemeData current;
  StyleThemeData(
      {this.themeName,
      this.c1,
      this.c2,
      this.c3,
      this.c4,
      this.c5,
      this.c6,
      this.c7,
      this.c8,
      this.c9,
      this.c10,
      this.c11,
      this.c12,
      this.c13,
      this.c14,
      this.c15,
      this.c16,
      this.c17,
      this.c18,
      this.c19,
      this.c20});
  static StyleThemeData createbasic() {
    basic = StyleThemeData(
        themeName: 'basic',
        c1: Color(0xff16163a),
        c2: Color(0xfffe941e),
        c3: Color(0xffd7dde2),
        c4: Color(0xff8c8c8c),
        c5: Color(0xffffffff),
        c6: Color(0xff00875a),
        c7: Color(0xffc71306),
        c8: Color(0xffcce8fe),
        c9: Color(0xff766dfe),
        c10: Color(0xff303151),
        c11: Color(0xff565872),
        c12: Color(0xff42436a),
        c13: Color(0xff2d2d50),
        c14: Color(0xff00a2ff),
        c15: Color(0xffe3c54f),
        c16: Color(0xfff0f4fc),
        c17: Color(0xffd4eaff),
        c18: Color(0xff000000),
        c19: Color(0xfffca23d),
        c20: Color(0xffffffff));

    return basic;
  }
}

class ThemeWrapper extends InheritedWidget {
  final StyleThemeData data;
  ThemeWrapper({@required this.data, @required child}) : super(child: child);
  bool updateShouldNotify(ThemeWrapper old) => data != old.data;
  static StyleThemeData of(BuildContext context) {
    final ThemeWrapper wrapper =
        context.dependOnInheritedWidgetOfExactType<ThemeWrapper>();

    return wrapper?.data;
  }
}
