import 'package:flutter/material.dart';
import 'package:flutter_app/application/models/sign_in_form_model.dart';
import 'package:flutter_app/router/route_constants.dart';
import 'package:flutter_app/style/branding_color.dart';
import 'package:flutter_app/style/constants.dart';
import 'package:flutter_app/style/images.dart';
import 'package:flutter_app/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: SafeArea(
          child: Injector(
            inject: [Inject<SignInFormModel>(() => SignInFormModel())],
            builder: (BuildContext context) {
              final _singletonSignInFormModel = RM.get<SignInFormModel>();
              return Container(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: smallPadding),
                  children: [
                    buildSizedBox(100),
                    Container(
                      height: 150,
                      child: Center(
                        child: Image.asset(Images.logo),
                      ),
                    ),
                    buildSizedBox(100),
                    // Email Form Field
                    StateBuilder<SignInFormModel>(
                      builder: (context, signInFormModel) {
                        return TextFormField(
                          onChanged: (String email) {
                            signInFormModel.setState(
                              (state) => state.setEmail(email),
                            );
                          },
                          decoration: InputDecoration(
                            errorText: signInFormModel.hasError
                                ? signInFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  signInInputTextBorderRadius),
                            ),
                            hintText: "Enter your email",
                          ),
                        );
                      },
                    ),

                    buildSizedBox(15),
                    // Password Form Field
                    StateBuilder<SignInFormModel>(
                      builder: (_, signInFormModel) {
                        return TextFormField(
                          onChanged: (String password) {
                            signInFormModel.setState(
                              (s) => s.setPassword(password),
                            );
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: signInFormModel.hasError
                                ? signInFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  signInInputTextBorderRadius),
                            ),
                            hintText: "Enter your password",
                          ),
                        );
                      },
                    ),

                    buildSizedBox(25),

                    // Sign In Button
                    StateBuilder(
                      observe: () => _singletonSignInFormModel,
                      builder: (_, signInFromModel) {
                        return MaterialButton(
                          onPressed: () {
                            if (!signInFromModel.state.validateData()) {
                              showSnackbar(
                                key: _key,
                                message: 'Data is invalid',
                                color: Colors.red,
                              );
                            } else {
                              signInFromModel.setState((state) async {
                                await state.submitSignIn();
                                Navigator.popAndPushNamed(context, homeRoute);
                              },
                                  onError: (context, error) => {
                                        showSnackbar(
                                          key: _key,
                                          message: error.message,
                                          color: Colors.red,
                                        )
                                      });
                            }
                          },
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
                        );
                      },
                    ),

                    buildSizedBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Don't have an account ? "),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signUpRoute);
                          },
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
              );
            },
          ),
        ));
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
