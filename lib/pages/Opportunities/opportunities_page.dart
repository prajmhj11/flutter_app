import 'package:flutter/material.dart';
import 'package:flutter_app/state/opportunity_state.dart';
import 'package:flutter_app/style/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class OpportunitiesPage extends StatefulWidget {
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with AutomaticKeepAliveClientMixin {
  final _opportunitiesStateRM = RM.get<OpportunityState>();
  @override
  void initState() {
    _opportunitiesStateRM
        .setState((opportunityState) => opportunityState.getAllOpportunities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    TextStyle _iconTextStyle = TextStyle(
      fontFamily: 'Dosis',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
    double _iconSize = 20;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Opportunity Page'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: StateBuilder<OpportunityState>(
          observe: () => _opportunitiesStateRM,
          builder: (_, model) {
            return Column(
              children: <Widget>[
                ...model.state.opportunities.map(
                  (opportunity) => Column(
                    children: [
                      // Opportunity Post Image
                      Image.asset(Images.test),
                      // Title
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          '${opportunity.title}',
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // Action buttons
                      Row(
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
                                  '${opportunity.category.name}',
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
                                '126',
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
                                '${opportunity.deadline}',
                                style: _iconTextStyle,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
