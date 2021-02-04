import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/application/storage/local_storage.dart';
import 'package:flutter_app/application/storage/storage_keys.dart';
import 'package:flutter_app/pages/Opportunities/opportunities_page.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/repositories/opportunity_repository.dart';
import 'package:flutter_app/router/route_constants.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_app/state/auth_state.dart';
import 'package:flutter_app/state/opportunity_state.dart';
import 'package:flutter_app/style/branding_color.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  // To initialize the plugins before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize shared_preferences
  await LocalStorage.initializeSharedPreferences();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<AuthState>(() => AuthState(AuthRepositoryImpl())),
        Inject<OpportunityState>(
            () => OpportunityState(OpportunityRepositoryImpl())),
      ],
      builder: (context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
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
            initialRoute:
                (LocalStorage.getItem(TOKEN) != null) ? homeRoute : signInRoute,
          ),
        );
      },
    );
  }
}
