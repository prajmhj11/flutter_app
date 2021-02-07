import 'package:dio/dio.dart';
import 'package:flutter_app/application/app_api.dart';
import 'package:flutter_app/application/classes/common/pagination.dart';
import 'package:flutter_app/application/classes/errors/common_error.dart';
import 'package:flutter_app/application/classes/opportunity/opportunities.dart';
import 'package:flutter_app/application/classes/opportunity/opportunity.dart';
import 'package:flutter_app/application/storage/local_storage.dart';
import 'package:flutter_app/application/storage/storage_keys.dart';

abstract class OpportunityRepository {
  // Fetch the opportunities
  Future<Opportunities> getAllOpportunities([int page]);
}

class OpportunityRepositoryImpl implements OpportunityRepository {
  @override
  Future<Opportunities> getAllOpportunities([int page = 1]) async {
    try {
      String url = '/api/opportunity';
      if (page > 1) {
        url = "/api/opportunity?page=" + page.toString();
      }
      print(url);
      final response = await AppApi.dio.get(url,
          options: Options(
            headers: {
              'Authorization':
                  "${LocalStorage.getItem(TOKEN_TYPE)} ${LocalStorage.getItem(TOKEN)}",
            },
          ));
      List _temp = response.data['data'] ?? [];
      var _meta = response.data['meta'] ?? [];

      Pagination pagination = Pagination.fromJson(_meta);

      List<Opportunity> _opportunities = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();

      return new Opportunities(
        pagination: pagination,
        opportunities: _opportunities,
      );
    } on DioError catch (e) {
      print(e.response);
      // throw showNetworkError(e);
    }
  }
}
