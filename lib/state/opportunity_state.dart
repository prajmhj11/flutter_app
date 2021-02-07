import 'package:flutter_app/application/classes/common/pagination.dart';
import 'package:flutter_app/application/classes/opportunity/opportunities.dart';
import 'package:flutter_app/application/classes/opportunity/opportunity.dart';
import 'package:flutter_app/repositories/opportunity_repository.dart';

class OpportunityState {
  final OpportunityRepository _opportunityRepository;
  OpportunityState(this._opportunityRepository);

  List<Opportunity> _opportunities = [];
  List<Opportunity> get opportunities => _opportunities;

  Pagination _pagination;
  bool _loading = false;
  bool get loading => _loading;

  Future getAllOpportunities() async {
    int currentPage = 1;
    bool fetchNext = false;

    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null &&
        _pagination.currentPage < _pagination.lastPage) {
      currentPage = _pagination.currentPage + 1;
      fetchNext = true;
    } else {
      fetchNext = false;
    }
    if (fetchNext) {
      _loading = true;
      Opportunities _newOpportunities =
          await _opportunityRepository.getAllOpportunities(currentPage);
      if (_newOpportunities.opportunities != null) {
        _opportunities.addAll(_newOpportunities.opportunities);
        _pagination = _newOpportunities.pagination;
      }
      _loading = false;
    }
    return;
  }

  Future getOpportunities() async {
    Opportunities _newOpportunities =
        await _opportunityRepository.getAllOpportunities();
    if (_newOpportunities.opportunities != null) {
      _opportunities = _newOpportunities.opportunities;
      _pagination = _newOpportunities.pagination;
    }
    return;
  }
}
