import '../utils/ObservableState.dart';
import '../utils/ObjectObservable.dart';
import 'Button.dart';
import 'package:flutter/widgets.dart';

typedef void _ButtonOnPressed();

class StateComponent extends StatefulWidget {
  StateComponent({Key key}) : super(key: key);
  @override
  _StateComponentState createState() => _StateComponentState();
}

class StateComponentRefs {
  ButtonState button = ButtonState();
  StateComponentRefs();
}

class ButtonState extends ObjectObservable {
  bool _pressed = true;
  int _numPressed = 0;
  ButtonState();
  bool get pressed {
    return _pressed;
  }

  setPressed(bool val) {
    bool isValChanged = _pressed != val;

    if (!isValChanged) {
      return;
    }

    _pressed = val;

    fire('pressed', this);
  }

  int get numPressed {
    return _numPressed;
  }

  setNumPressed(int val) {
    bool isValChanged = _numPressed != val;

    if (!isValChanged) {
      return;
    }

    _numPressed = val;

    fire('numPressed', this);
  }
}

class ButtonWithState extends StatefulWidget {
  final StateComponentRefs state;
  final _ButtonOnPressed handlePress;
  ButtonWithState({Key key, this.state, this.handlePress}) : super(key: key);
  @override
  _ButtonWithState createState() => _ButtonWithState();
}

class _ButtonWithState extends ObservableState<ButtonWithState> {
  @override
  initState() {
    super.initState();

    updateObservable('button', null, button);

    initListeners();

    enableBuild = true;
  }

  void initListeners() {
    this.on(['button'], rebuild);
  }

  _ButtonOnPressed get handlePress => this.widget.handlePress;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Button(
        onPressed: () {
          handlePress();
        },
        child: Text('Hit Me!'));
  }

  StateComponentRefs get state => widget.state;
  ButtonState get button => widget.state.button;
}

class _StateComponentState extends ObservableState<StateComponent> {
  StateComponentRefs state = StateComponentRefs();
  @override
  initState() {
    super.initState();

    initListeners();

    enableBuild = true;
  }

  void initListeners() {}
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (state.button.pressed)
        Text('Button pressed')
      else
        Text('Button NOT pressed'),
      ButtonWithState(state: state, handlePress: handlePress)
    ]);
  }

  void handlePress() {
    state.button.setPressed(true);
  }
}
