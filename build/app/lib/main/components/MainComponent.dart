import '../utils/ObservableState.dart';
import 'SubComponent.dart';
import 'package:flutter/widgets.dart';

class MainComponent extends StatefulWidget {
  final String fromOutside;
  MainComponent({Key key, this.fromOutside = ''}) : super(key: key);
  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends ObservableState<MainComponent> {
  String _data = '';
  @override
  initState() {
    super.initState();

    initListeners();

    enableBuild = true;

    onInit();
  }

  void initListeners() {
    this.on(['data'], rebuild);
  }

  String get fromOutside {
    return this.widget.fromOutside;
  }

  String get data {
    return _data;
  }

  void setData(String val) {
    bool isValChanged = _data != val;

    if (!isValChanged) {
      return;
    }

    _data = val;

    this.fire('data', this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text(this.data),
      SubComponent(title: 'AssignedValue'),
      SubComponent(title: 'BoundValue')
    ]));
  }

  void onInit() {
    this.setData('MyData');
  }
}
