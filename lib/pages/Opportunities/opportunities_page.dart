import 'package:flutter/material.dart';
import 'package:flutter_app/router/route_constants.dart';
import 'package:flutter_app/state/opportunity_state.dart';
import 'package:flutter_app/style/images.dart';
import 'package:flutter_app/widgets/opportunity_actions_widget.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class OpportunitiesPage extends StatefulWidget {
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with AutomaticKeepAliveClientMixin {
  final _opportunitiesStateRM = RM.get<OpportunityState>();
  ScrollController _scrollController = ScrollController();

  var refreshkey = GlobalKey<RefreshIndicatorState>();

  @override
  void didChangeDependencies() {
    _getNewOpportunities();
    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (currentPosition >= maxScrollExtent) {
        _getNewOpportunities();
      }
    });

    super.didChangeDependencies();
  }

  void _getNewOpportunities() {
    _opportunitiesStateRM.setState(
      (opportunityState) => opportunityState.getAllOpportunities(),
    );
  }

  Future<Null> refreshlist() async {
    refreshkey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
    _opportunitiesStateRM.setState((s) => s.getOpportunities());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    void _toTop(bool toTop) {
      if (toTop) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(seconds: 2),
            curve: Curves.easeOut,
          );
          setState(() {
            toTop = false;
          });
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 70,
          child: ClipOval(
            child: Image.asset(
              Images.logo,
              height: 50,
              width: 50,
            ),
          ),
        ),
        title: Center(
          child: Text('Opportunity Page'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        key: refreshkey,
        onRefresh: refreshlist,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          controller: _scrollController,
          child: StateBuilder<OpportunityState>(
            observe: () => _opportunitiesStateRM,
            builder: (_, model) {
              return Column(
                children: <Widget>[
                  ...model.state.opportunities.map(
                    (opportunity) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          opportunityDetailsRoute,
                          arguments: opportunity,
                        );
                      },
                      child: Column(
                        children: [
                          // Opportunity Post Image
                          (opportunity.image != null)
                              ? Image.network("${opportunity.image}")
                              : Image.asset(Images.test),

                          // Title
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                          OpportunityActionsWidget(
                            categoryName: opportunity.category.name,
                            views: opportunity.id.toString(),
                            deadline: opportunity.deadline,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      // Floating Action Btn
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.vertical_align_top),
        onPressed: () {
          _toTop(true);
        },
        heroTag: 'topBtn',
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
