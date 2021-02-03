import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/Opportunities/opportunities_page.dart';
import 'package:flutter_app/router/route_constants.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_app/style/branding_color.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: brandingColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OpportunitiesPage(),
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: signInRoute,
      ),
    );
  }
}
