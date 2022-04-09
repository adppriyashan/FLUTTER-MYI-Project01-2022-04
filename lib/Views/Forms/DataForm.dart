import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Strings.dart';
import 'package:myiproject/Models/Utils.dart';

class DataForm extends StatefulWidget {
  DataForm({Key? key}) : super(key: key);

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final double topSpace = Utils.displaySize.width * 0.4;

  String? selectedGender = null;
  String physicalActivityLevel='High';
  TextEditingController _username = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _bodyFat = TextEditingController();
  TextEditingController _fastBloodSugar = TextEditingController();
  TextEditingController _allegies = TextEditingController();

  late DatabaseReference _databaseRef;

   final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _databaseRef = FirebaseDatabase.instance.ref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: UtilColors.primaryColorLight,
      body: SizedBox(
          width: Utils.displaySize.width,
          height: Utils.displaySize.height,
          child: Stack(
            children: [
              SizedBox(
                width: Utils.displaySize.width,
                height: Utils.displaySize.height,
                child: Image.asset(
                  'assets/img/reg.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("NutriTella",
                            style: GoogleFonts.italianno(
                                fontSize: 50.0,
                                color: UtilColors.primaryColor)),
                      ),
                      Text("Username :",
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.blackColor)),
                      SizedBox(
                        height: 30.0,
                        child: TextFormField(
                          cursorColor: UtilColors.primaryColor,
                          keyboardType: TextInputType.text,
                          style: Utils.getprimaryFieldTextStyle2(
                              UtilColors.blackColor),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Age :",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.0,
                                        color: UtilColors.blackColor)),
                                SizedBox(
                                    height: 30.0,
                                    child: TextFormField(
                                      cursorColor: UtilColors.primaryColor,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Utils.getprimaryFieldTextStyle2(
                                          UtilColors.blackColor),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                    )),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Gender :",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.0,
                                        color: UtilColors.blackColor)),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedGender,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      TextStyle(color: UtilColors.primaryColor),
                                  underline: Container(
                                    height: 2,
                                    color: UtilColors.primaryColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGender = newValue!;
                                    });
                                  },
                                  items: <String>['Male', 'Female']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Height :",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.0,
                                        color: UtilColors.blackColor)),
                                SizedBox(
                                    height: 30.0,
                                    child: TextFormField(
                                      cursorColor: UtilColors.primaryColor,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Utils.getprimaryFieldTextStyle2(
                                          UtilColors.blackColor),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                    )),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Weight :",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.0,
                                        color: UtilColors.blackColor)),
                                SizedBox(
                                    height: 30.0,
                                    child: TextFormField(
                                      cursorColor: UtilColors.primaryColor,
                                      keyboardType: TextInputType.emailAddress,
                                      style: Utils.getprimaryFieldTextStyle2(
                                          UtilColors.blackColor),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                    )),
                              ],
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Body Fat :",
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.blackColor)),
                      SizedBox(
                          height: 30.0,
                          child: TextFormField(
                            cursorColor: UtilColors.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            style: Utils.getprimaryFieldTextStyle2(
                                UtilColors.blackColor),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Fast Blood Sugar :",
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.blackColor)),
                      SizedBox(
                          height: 30.0,
                          child: TextFormField(
                            cursorColor: UtilColors.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            style: Utils.getprimaryFieldTextStyle2(
                                UtilColors.blackColor),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Allergies :",
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.blackColor)),
                      SizedBox(
                          height: 30.0,
                          child: TextFormField(
                            cursorColor: UtilColors.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            style: Utils.getprimaryFieldTextStyle2(
                                UtilColors.blackColor),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Physical activity level :",
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.blackColor)),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {}),
                              Text("High",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15.0,
                                      color: UtilColors.blackColor))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {}),
                              Text("Medium",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15.0,
                                      color: UtilColors.blackColor))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {}),
                              Text("Low",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15.0,
                                      color: UtilColors.blackColor))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Lipid Profile :",
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.blackColor)),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {}),
                              Text("High",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15.0,
                                      color: UtilColors.blackColor))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {}),
                              Text("Medium",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15.0,
                                      color: UtilColors.blackColor))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {}),
                              Text("Low",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15.0,
                                      color: UtilColors.blackColor))
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: Utils.displaySize.width * 0.5,
                          child: TextButton(
                            child: Text(
                              "SUBMIT",
                              style: GoogleFonts.openSans(),
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  UtilColors.blackColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  UtilColors.whiteColor),
                            ),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){

                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: UtilColors.whiteColor,
                            ),
                            Text("BACK",
                                style: GoogleFonts.openSans(
                                    fontSize: 15.0,
                                    color: UtilColors.whiteColor))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  )),
                ),
              )
            ],
          )),
    ));
  }
}
