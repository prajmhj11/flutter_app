import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OpportunityActionsWidget extends StatelessWidget {
  final String categoryName;
  final String views;
  final String deadline;

  const OpportunityActionsWidget({
    Key key,
    @required this.categoryName,
    @required this.views,
    @required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _iconTextStyle = TextStyle(
      fontFamily: 'Dosis',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
    double _iconSize = 20;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Opportunity Category
        FlatButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.school,
                size: _iconSize,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '$categoryName',
                style: _iconTextStyle,
              )
            ],
          ),
        ),
        // Views --> How many have viewed the post
        Row(
          children: [
            Icon(
              Icons.remove_red_eye,
              size: _iconSize,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '$views',
              style: _iconTextStyle,
            )
          ],
        ),
        // Share button
        FlatButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.share,
                size: _iconSize,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Share',
                style: _iconTextStyle,
              )
            ],
          ),
        ),
        // Calender --> Deadline time
        Row(
          children: [
            Icon(
              Icons.event,
              size: _iconSize,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '$deadline',
              style: _iconTextStyle,
            )
          ],
        ),
      ],
    );
  }
}
