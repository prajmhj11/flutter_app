import 'package:flutter/material.dart';
import 'package:flutter_app/application/models/sign_up_form_model.dart';
import 'package:flutter_app/router/route_constants.dart';
import 'package:flutter_app/style/branding_color.dart';
import 'package:flutter_app/style/constants.dart';
import 'package:flutter_app/style/images.dart';
import 'package:flutter_app/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: SafeArea(
          child: Injector(
            inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
            builder: (BuildContext context) {
              Injector.getAsReactive<SignUpFormModel>();
              return Container(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: smallPadding),
                  children: [
                    buildSizedBoxHeight(50),
                    Container(
                      height: 100,
                      child: Center(
                        child: Image.asset(Images.logo),
                      ),
                    ),
                    buildSizedBoxHeight(100),
                    // First Name and Last Name
                    Row(
                      children: [
                        new Flexible(
                          child: StateBuilder<SignUpFormModel>(
                            builder: (context, signUpFormModel) {
                              return TextFormField(
                                onChanged: (String firstName) {
                                  signUpFormModel.setState(
                                    (state) => state.setFirstName(firstName),
                                  );
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        signInInputTextBorderRadius),
                                  ),
                                  hintText: "First name",
                                ),
                              );
                            },
                          ),
                        ),
                        buildSizedBoxWidth(10),
                        new Flexible(
                          child: StateBuilder<SignUpFormModel>(
                            builder: (context, signUpFormModel) {
                              return TextFormField(
                                onChanged: (String lastName) {
                                  signUpFormModel.setState(
                                    (state) => state.setLastName(lastName),
                                  );
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        signInInputTextBorderRadius),
                                  ),
                                  hintText: "Last name",
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    buildSizedBoxHeight(15),
                    // Email Form Field
                    StateBuilder<SignUpFormModel>(
                      builder: (context, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String email) {
                            signUpFormModel.setState(
                              (state) => state.setEmail(email),
                            );
                          },
                          decoration: InputDecoration(
                            errorText: signUpFormModel.hasError
                                ? signUpFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  signInInputTextBorderRadius),
                            ),
                            hintText: "Email",
                          ),
                        );
                      },
                    ),

                    buildSizedBoxHeight(15),
                    // Password Form Field
                    StateBuilder<SignUpFormModel>(
                      builder: (_, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String password) {
                            signUpFormModel.setState(
                              (s) => s.setPassword(password),
                            );
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: signUpFormModel.hasError
                                ? signUpFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  signInInputTextBorderRadius),
                            ),
                            hintText: "Password",
                          ),
                        );
                      },
                    ),

                    buildSizedBoxHeight(15),
                    // Password Form Field
                    StateBuilder<SignUpFormModel>(
                      builder: (_, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String passwordConfirmation) {
                            signUpFormModel.setState(
                              (s) => s.setPasswordConfirmation(
                                  passwordConfirmation),
                            );
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: signUpFormModel.hasError
                                ? signUpFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  signInInputTextBorderRadius),
                            ),
                            hintText: "Confirm Password",
                          ),
                        );
                      },
                    ),

                    buildSizedBoxHeight(25),

                    // Sign In Button
                    StateBuilder<SignUpFormModel>(
                      builder: (_, signUpFromModel) {
                        return MaterialButton(
                          onPressed: () {
                            if (!signUpFromModel.state.validateData()) {
                              _key.currentState.showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Data is invalid"),
                              ));
                            } else {
                              signUpFromModel.setState((s) => s.submitSignUp(),
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
                              'Sign Up',
                              style: TextStyle(
                                color: secondaryColor[900],
                                fontSize: signInButtonFontSize,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    buildSizedBoxHeight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Already have an account ? "),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signInRoute);
                          },
                          child: Text(
                            "Sign In",
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

  SizedBox buildSizedBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }

  SizedBox buildSizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }
}
