import 'package:flutter/material.dart';
import 'package:flutter_app/application/storage/local_storage.dart';
import 'package:flutter_app/application/storage/storage_keys.dart';
import 'package:flutter_app/router/route_constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Account')),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: MaterialButton(
          onPressed: () async {
            await LocalStorage.clearStorage();
            Navigator.popAndPushNamed(context, signInRoute);
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
