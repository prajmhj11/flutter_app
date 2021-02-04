import 'package:flutter_app/application/classes/opportunity/opportunity.dart';
import 'package:flutter_app/repositories/opportunity_repository.dart';

class OpportunityState {
  final OpportunityRepository _opportunityRepository;

  OpportunityState(this._opportunityRepository);

  List<Opportunity> _opportunities = [];

  List<Opportunity> get opportunities => _opportunities;

  Future getAllOpportunities() async {
    _opportunities = await _opportunityRepository.getAllOpportunities();
  }
}
