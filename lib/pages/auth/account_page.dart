import 'package:flutter/material.dart';
import 'package:flutter_app/application/classes/auth/user.dart';
import 'package:flutter_app/application/storage/local_storage.dart';
import 'package:flutter_app/router/route_constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User user;
  @override
  void initState() {
    super.initState();
    user = User.fromJson(LocalStorage.test());
    print(user.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('User Account'),
        actions: [
          FlatButton(
            hoverColor: Colors.grey,
            onPressed: () async {
              await LocalStorage.clearStorage();
              Navigator.popAndPushNamed(context, signInRoute);
            },
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: profileView(),
          ),
        ),
      ),
    );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                      child: (this.user.profilePicture == null)
                          ? Image.asset(
                              "assets/images/profile.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              "${this.user.profilePicture}",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        height: 40,
                        width: 50,
                        child: FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ))
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${this.user.firstName}',
                          style: userDetailTextStyle(),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${this.user.lastName}',
                          style: userDetailTextStyle(),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${this.user.email}',
                          style: userDetailTextStyle(),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Visibility(
                    visible: (this.user.bio == null && this.user.bio == '')
                        ? false
                        : true,
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${this.user.bio}',
                            style: userDetailTextStyle(),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.white)),
                    ),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: 150,
                          child: Align(
                            child: Text(
                              'Save',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle userDetailTextStyle() => TextStyle(
        color: Colors.white,
        fontFamily: 'Dosis',
        fontSize: 16,
        fontWeight: FontWeight.w800,
      );
}
