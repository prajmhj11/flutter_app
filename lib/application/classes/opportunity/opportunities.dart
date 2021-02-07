import 'package:flutter/foundation.dart';
import 'package:flutter_app/application/classes/common/pagination.dart';
import 'package:flutter_app/application/classes/opportunity/opportunity.dart';

class Opportunities {
  final Pagination pagination;
  final List<Opportunity> opportunities;

  Opportunities({
    @required this.pagination,
    @required this.opportunities,
  });
}
