import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myiproject/Controllers/Auth/AuthController.dart';
import 'package:myiproject/Controllers/Auth/AuthValidator.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Strings.dart';
import 'package:myiproject/Models/Utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;

  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(Utils.lightNavbar);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double spaceAround = 10.0;
    double fieldspaces = 15.0;
    double fieldspacesmid = (Utils.displaySize.height < 1000) ? 5 : 20;
    double fieldspacesmax = 30.0;
    double fontsize = 12;

    // final AuthController authController = AuthController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: UtilColors.greyColor,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  width: Utils.displaySize.width,
                  height: Utils.displaySize.height,
                  decoration: Utils.getGradientBackground(),
                ),
                SizedBox(
                  width: Utils.displaySize.width,
                  height: Utils.displaySize.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: spaceAround, vertical: spaceAround),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Form(
                                key: _registerFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: fieldspaces,
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              UtilStrings.appTitleSection1
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 23.0,
                                                  color:
                                                      UtilColors.primaryColor)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                                UtilStrings.appTitleSection2
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 23.0,
                                                    color: UtilColors
                                                        .secondaryColor)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0, bottom: 10.0),
                                        child: Text(
                                          UtilStrings.registrationSubTitle
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w600,
                                              foreground: Paint()
                                                ..shader =
                                                    Utils.getTextGradient()),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: fieldspacesmid,
                                    ),
                                    TextFormField(
                                      controller: _name,
                                      decoration:
                                          Utils.getDefaultTextInputDecoration(
                                              'Name',
                                              Icon(
                                                Icons.person,
                                                color: UtilColors.greyColor
                                                    .withOpacity(0.6),
                                              )),
                                      cursorColor: UtilColors.primaryColor,
                                      keyboardType: TextInputType.name,
                                      style: Utils.getprimaryFieldTextStyle(
                                          UtilColors.greyColor),
                                      validator: (value) {
                                        return AuthValidator.validateName(
                                            value!);
                                      },
                                    ),
                                    SizedBox(
                                      height: fieldspacesmid,
                                    ),
                                    TextFormField(
                                      controller: _mobile,
                                      decoration:
                                          Utils.getDefaultTextInputDecoration(
                                              'Mobile Number',
                                              Icon(
                                                Icons.send_to_mobile,
                                                color: UtilColors.greyColor
                                                    .withOpacity(0.6),
                                              )),
                                      cursorColor: UtilColors.primaryColor,
                                      keyboardType: TextInputType.number,
                                      style: Utils.getprimaryFieldTextStyle(
                                          UtilColors.greyColor),
                                      validator: (value) {
                                        return AuthValidator.validateMobile(
                                            value!);
                                      },
                                    ),
                                    SizedBox(
                                      height: fieldspacesmid,
                                    ),
                                    TextFormField(
                                      controller: _email,
                                      decoration:
                                          Utils.getDefaultTextInputDecoration(
                                              'Email',
                                              Icon(
                                                Icons.email,
                                                color: UtilColors.greyColor
                                                    .withOpacity(0.6),
                                              )),
                                      cursorColor: UtilColors.primaryColor,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Utils.getprimaryFieldTextStyle(
                                          UtilColors.greyColor),
                                      validator: (value) {
                                        return AuthValidator.validateUsername(
                                            value!);
                                      },
                                    ),
                                    SizedBox(
                                      height: fieldspacesmid,
                                    ),
                                    TextFormField(
                                      controller: _password,
                                      decoration:
                                          Utils.getDefaultTextInputDecoration(
                                              'Password',
                                              Icon(Icons.lock,
                                                  color: UtilColors.greyColor
                                                      .withOpacity(0.6))),
                                      cursorColor: UtilColors.primaryColor,
                                      obscureText: _obscurePassword1,
                                      keyboardType: TextInputType.text,
                                      style: Utils.getprimaryFieldTextStyle(
                                          UtilColors.blackColor),
                                      validator: (value) {
                                        return AuthValidator.validatePassword(
                                            value!);
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _obscurePassword1 = true;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: fieldspacesmid,
                                    ),
                                    TextFormField(
                                      controller: _repassword,
                                      decoration:
                                          Utils.getDefaultTextInputDecoration(
                                              'Retype Password',
                                              Icon(Icons.lock,
                                                  color: UtilColors.greyColor
                                                      .withOpacity(0.6))),
                                      cursorColor: UtilColors.primaryColor,
                                      obscureText: _obscurePassword2,
                                      keyboardType: TextInputType.text,
                                      style: Utils.getprimaryFieldTextStyle(
                                          UtilColors.blackColor),
                                      validator: (value) {
                                        return AuthValidator
                                            .validateRetypePassword(
                                                _password.text, value!);
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _obscurePassword2 = true;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: fieldspaces,
                                    ),
                                    SizedBox(
                                      child: FlatButton(
                                        onPressed: () async {
                                          if (_registerFormKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            Utils.showLoader(context);
                                            await _authController
                                                .doRegistration({
                                              'name': _name.text.toString(),
                                              'mobile': _mobile.text.toString(),
                                              'email': _email.text.toString(),
                                              'type': 2,
                                              'password':
                                                  _password.text.toString(),
                                            }).then((value) =>
                                                    Utils.hideLoaderCurrrent(
                                                        context));

                                            _registerFormKey.currentState!
                                                .reset();

                                            _name.text = '';
                                            _mobile.text = '';
                                            _email.text = '';
                                            _password.text = '';
                                            _repassword.text = '';
                                          }
                                        },
                                        child: const Text(
                                          "REGISTER NOW",
                                        ),
                                        color: UtilColors.primaryColor,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Utils.buttonBorderRadius),
                                            side: BorderSide(
                                                color:
                                                    UtilColors.secondaryColor)),
                                        height: 42.0,
                                      ),
                                      width: Utils.displaySize.width,
                                    ),
                                    SizedBox(
                                      height: fieldspacesmax,
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Already have an account, Login now !',
                                          style: TextStyle(fontSize: fontsize),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: fieldspaces,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
