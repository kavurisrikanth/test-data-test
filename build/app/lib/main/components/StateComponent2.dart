import '../utils/ObservableState.dart';
import '../utils/CollectionUtils.dart';
import 'package:flutter/widgets.dart';

class StateComponent2 extends StatefulWidget {
  StateComponent2({Key key}) : super(key: key);
  @override
  _StateComponent2State createState() => _StateComponent2State();
}

class _StateComponent2State extends ObservableState<StateComponent2> {
  List<int> _nums = [];
  @override
  initState() {
    super.initState();

    initListeners();

    enableBuild = true;

    onInit();
  }

  void initListeners() {}
  List<int> get nums {
    return _nums;
  }

  void setNums(List<int> val) {
    bool isValChanged = CollectionUtils.isNotEquals(_nums, val);

    if (!isValChanged) {
      return;
    }

    _nums.clear();

    _nums.addAll(val);

    this.fire('nums', this);
  }

  void addToNums(int val, [int index = -1]) {
    if (index == -1) {
      if (!_nums.contains(val)) _nums.add(val);
    } else {
      _nums.insert(index, val);
    }

    fire('nums', this, val, true);
  }

  void removeFromNums(int val) {
    _nums.remove(val);

    fire('nums', this, val, false);
  }

  @override
  Widget build(BuildContext context) {
    return Row();
  }

  void onInit() {
    this.setNums([1, 2, 3, 4]);
  }
}
