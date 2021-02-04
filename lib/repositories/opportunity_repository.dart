import 'package:dio/dio.dart';
import 'package:flutter_app/application/app_api.dart';
import 'package:flutter_app/application/classes/errors/common_error.dart';
import 'package:flutter_app/application/classes/opportunity/opportunity.dart';
import 'package:flutter_app/application/storage/local_storage.dart';
import 'package:flutter_app/application/storage/storage_keys.dart';

abstract class OpportunityRepository {
  // Fetch the opportunities
  Future<List<Opportunity>> getAllOpportunities();
}

class OpportunityRepositoryImpl implements OpportunityRepository {
  @override
  Future<List<Opportunity>> getAllOpportunities() async {
    try {
      final response = await AppApi.dio.get('/api/opportunity',
          options: Options(
            headers: {
              'Authorization':
                  "${LocalStorage.getItem(TOKEN_TYPE)} ${LocalStorage.getItem(TOKEN)}",
            },
          ));
      List _temp = response.data['data'] ?? [];
      var _meta = response.data['meta'] ?? [];

      print(_meta);
      List<Opportunity> _opportunities = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();
      // print(_opportunities);
      return _opportunities;
    } on DioError catch (e) {
      print(e.response);
      // throw showNetworkError(e);
    }
  }
}
