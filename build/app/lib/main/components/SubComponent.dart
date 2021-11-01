import '../utils/ObservableState.dart';
import 'StateComponent.dart';
import 'StateComponent2.dart';
import 'package:flutter/widgets.dart';

class SubComponent extends StatefulWidget {
  final String title;
  final String assigned;
  final String bound;
  SubComponent({Key key, this.title = '', this.assigned = '', this.bound = ''})
      : super(key: key);
  @override
  _SubComponentState createState() => _SubComponentState();
}

class _SubComponentState extends ObservableState<SubComponent> {
  @override
  initState() {
    super.initState();

    initListeners();

    enableBuild = true;
  }

  void initListeners() {}
  String get title {
    return this.widget.title;
  }

  String get assigned {
    return this.widget.assigned;
  }

  String get bound {
    return this.widget.bound;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Text(this.title), StateComponent(), StateComponent2()]);
  }
}
