import 'package:flutter/material.dart';
import 'package:flutter_app/style/branding_color.dart';
import 'package:flutter_app/style/constants.dart';
import 'package:flutter_app/style/images.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(smallPadding),
        child: ListView(
          children: [
            Container(
              height: 150,
              child: Center(
                child: Image.asset(Images.logo),
              ),
            ),
            buildSizedBox(100),
            // Email Form Field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(signInInputTextBorderRadius),
                ),
                hintText: "Enter your email",
              ),
            ),
            buildSizedBox(15),
            // Password Form Field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(signInInputTextBorderRadius),
                ),
                hintText: "Enter your password",
              ),
            ),
            buildSizedBox(25),
            // Sign In Button
            MaterialButton(
              onPressed: () {},
              height: 50,
              shape: StadiumBorder(),
              color: brandingColor[700],
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: secondaryColor[900],
                    fontSize: signInButtonFontSize,
                  ),
                ),
              ),
            ),
            buildSizedBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Don't have an account ? "),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: sweetColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
