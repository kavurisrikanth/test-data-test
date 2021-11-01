import 'main/classes/PageNavigator.dart';
import 'main/components/MainComponent.dart';
import 'main/components/ThemeWrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StyleThemeData.current = StyleThemeData.createbasic();

    GoogleFonts.poppins();

    return WidgetsApp(
        shortcuts:
            Map<ShortcutActivator, Intent>.from(WidgetsApp.defaultShortcuts)
              ..addAll(<LogicalKeySet, Intent>{
                LogicalKeySet(LogicalKeyboardKey.arrowDown):
                    DirectionalFocusIntent(TraversalDirection.down),
                LogicalKeySet(LogicalKeyboardKey.arrowUp):
                    DirectionalFocusIntent(TraversalDirection.up),
                LogicalKeySet(LogicalKeyboardKey.arrowLeft):
                    DirectionalFocusIntent(TraversalDirection.left),
                LogicalKeySet(LogicalKeyboardKey.arrowRight):
                    DirectionalFocusIntent(TraversalDirection.right)
              }),
        title: 'TestDataTest2 - App',
        textStyle: TextStyle(
            color: Color(0xff000000),
            fontFamily: 'Poppins_regular',
            fontSize: 13.0),
        color: Color(0xffffffff),
        onGenerateRoute: (rs) {
          return PageRouteBuilder(
              pageBuilder: (ctx, _, __) =>
                  PageNavigator.of(ctx).wrapTheme(MainComponent()));
        });
  }
}
