import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/application/classes/opportunity/opportunity.dart';
import 'package:flutter_app/style/images.dart';
import 'package:flutter_app/widgets/opportunity_actions_widget.dart';

class OpportunityDetailPage extends StatefulWidget {
  @override
  _OpportunityDetailPageState createState() => _OpportunityDetailPageState();
}

class _OpportunityDetailPageState extends State<OpportunityDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Opportunity opportunity =
        ModalRoute.of(context).settings.arguments as Opportunity;

    TextStyle _headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Dosis',
      fontSize: 20,
    );
    TextStyle _paragraphStyle = TextStyle(
      fontFamily: 'Dosis',
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      appBar: new AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            (opportunity.image != null)
                ? Image.network("${opportunity.image}")
                : Image.asset(Images.test),
            // Opportunity Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                '${opportunity.title}',
                style: TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            OpportunityActionsWidget(
              categoryName: opportunity.category.name,
              views: opportunity.id.toString(),
              deadline: opportunity.deadline,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Created By: '),
                      Text('${opportunity.createdBy.name}'),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Benefits",
                    style: _headingStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    opportunity.opportunityDetail.benefits,
                    style: _paragraphStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Benefits",
                    style: _headingStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    opportunity.opportunityDetail.benefits,
                    style: _paragraphStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
