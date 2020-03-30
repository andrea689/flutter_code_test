import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BeeCheckbox extends HookWidget {
  final bool value;
  final GestureTapCallback onTap;

  const BeeCheckbox({this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value ? Theme.of(context).accentColor : Colors.transparent,
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 2,
            ),
          ),
          child: Visibility(
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            visible: value,
            child: Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
