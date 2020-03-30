import 'package:flutter/material.dart';

class HoneyPointsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Riepilogo',
            style: Theme.of(context).textTheme.title,
          ),
          Icon(
            Icons.apps,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
