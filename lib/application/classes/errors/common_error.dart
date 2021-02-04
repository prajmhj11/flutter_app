import 'package:dio/dio.dart';

class CommonErrors extends Error {
  CommonErrors(this.message);
  final String message;
}

CommonErrors showNetworkError(DioError networkError) {
  String message = "";

  if (networkError.response != null) {
    if (networkError.response.statusCode == 401) {
      Map<String, dynamic> err = networkError.response.data;
      message = err['errors'];
    } else if (networkError.response.statusCode == 422) {
      Map<String, dynamic> validationErrors =
          networkError.response.data['errors'];

      print(validationErrors);

      for (var err in validationErrors.values) {
        message += "\n$err";
      }
    } else {
      message = "An error has occured";
    }
  } else {
    message = "Can't reach to the server.";
  }

  throw CommonErrors(message);
}
