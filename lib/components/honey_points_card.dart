import 'package:flutter/material.dart';
import 'package:three_bee_code_test/components/bee_checkbox.dart';
import 'package:three_bee_code_test/models/task.dart';

class HoneyPointsCard extends StatelessWidget {
  final Task task;
  final GestureTapCallback onTap;

  const HoneyPointsCard({
    Key key,
    this.onTap,
    @required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTap() {
      if (task.enabled) {
        onTap();
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: GestureDetector(
        onTap: _handleTap,
        child: Card(
          color: task.enabled
              ? Theme.of(context).cardColor
              : Color.fromARGB(255, 72, 72, 72),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: task.checked
                  ? Theme.of(context).accentColor
                  : Theme.of(context).cardColor,
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/bee_coin.png',
                        width: 40,
                        color: task.enabled
                            ? Colors.transparent
                            : Color.fromARGB(255, 72, 72, 72),
                        colorBlendMode: BlendMode.hue,
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: BeeCheckbox(
                          value: task.checked,
                          onTap: _handleTap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              task.title,
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            Text(
                              '${task.points} punti',
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Visibility(
                                  visible: task.type == 'upload_photo',
                                  child: Expanded(
                                    child: Center(
                                      child: Text('Aggiungi foto'),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: task.type == 'upload_video',
                                  child: Expanded(
                                    child: Center(
                                      child: Text('Aggiungi video'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    task.body,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Visibility(
                                      visible: task.type == 'tasting',
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
