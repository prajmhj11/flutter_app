import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Home/home_page.dart';
import 'package:flutter_app/pages/Not%20found/not_found_page.dart';
import 'package:flutter_app/pages/Opportunities/opportunities_page.dart';
import 'package:flutter_app/pages/auth/sign_in_page.dart';
import 'package:flutter_app/pages/auth/sign_up_page.dart';
import 'package:flutter_app/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case opportunitiesRoute:
        return MaterialPageRoute(builder: (_) => OpportunitiesPage());
      case opportunityDetailsRoute:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
