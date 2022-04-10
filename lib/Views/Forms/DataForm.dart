import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Strings.dart';
import 'package:myiproject/Models/Utils.dart';

class DataForm extends StatefulWidget {
  var data;

  DataForm({Key? key, this.data}) : super(key: key);

  @override
  State<DataForm> createState() => _DataFormState(data: this.data);
}

class _DataFormState extends State<DataForm> {
  var data;

  _DataFormState({this.data});

  final double topSpace = Utils.displaySize.width * 0.4;

  String? selectedGender;
  String physicalActivityLevel = 'High';
  String lipidProfileLevel = 'High';
  final TextEditingController _username = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _bodyFat = TextEditingController();
  final TextEditingController _fastBloodSugar = TextEditingController();
  final TextEditingController _allegies = TextEditingController();

  late DatabaseReference _databaseRef;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _databaseRef = FirebaseDatabase.instance.ref();

    if (data != null) {
      setState(() {
        _username.text = data['username'];
        _age.text = data['age'];
        selectedGender = data['gender'];
        _height.text = data['height'];
        _weight.text = data['weight'];
        _bodyFat.text = data['bodyfat'];
        _fastBloodSugar.text = data['fastbloodsugar'];
        _allegies.text = data['allegies'];
        physicalActivityLevel = data['pal'];
        lipidProfileLevel = data['lp'];
      });
    }

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
                                  fontSize: 15.0,
                                  color: UtilColors.blackColor)),
                          SizedBox(
                            height: 30.0,
                            child: TextFormField(
                              controller: _username,
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
                                          controller: _age,
                                          cursorColor: UtilColors.primaryColor,
                                          keyboardType: TextInputType.number,
                                          style:
                                              Utils.getprimaryFieldTextStyle2(
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
                                      style: TextStyle(
                                          color: UtilColors.primaryColor),
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
                                          controller: _height,
                                          cursorColor: UtilColors.primaryColor,
                                          keyboardType: TextInputType.number,
                                          style:
                                              Utils.getprimaryFieldTextStyle2(
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
                                          controller: _weight,
                                          cursorColor: UtilColors.primaryColor,
                                          keyboardType: TextInputType.number,
                                          style:
                                              Utils.getprimaryFieldTextStyle2(
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
                                  fontSize: 15.0,
                                  color: UtilColors.blackColor)),
                          SizedBox(
                              height: 30.0,
                              child: TextFormField(
                                controller: _bodyFat,
                                cursorColor: UtilColors.primaryColor,
                                keyboardType: TextInputType.number,
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
                                  fontSize: 15.0,
                                  color: UtilColors.blackColor)),
                          SizedBox(
                              height: 30.0,
                              child: TextFormField(
                                controller: _fastBloodSugar,
                                cursorColor: UtilColors.primaryColor,
                                keyboardType: TextInputType.number,
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
                                  fontSize: 15.0,
                                  color: UtilColors.blackColor)),
                          SizedBox(
                              height: 30.0,
                              child: TextFormField(
                                controller: _allegies,
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
                              )),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text("Physical activity level :",
                              style: GoogleFonts.openSans(
                                  fontSize: 15.0,
                                  color: UtilColors.blackColor)),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      value: (physicalActivityLevel == 'High')
                                          ? true
                                          : false,
                                      groupValue: true,
                                      onChanged: (value) {
                                        setState(() {
                                          physicalActivityLevel =
                                              ((value == false) ? 'High' : '');
                                        });
                                      }),
                                  Text("High",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.0,
                                          color: UtilColors.blackColor))
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: (physicalActivityLevel == 'Medium')
                                          ? true
                                          : false,
                                      groupValue: true,
                                      onChanged: (value) {
                                        setState(() {
                                          physicalActivityLevel =
                                              ((value == false)
                                                  ? 'Medium'
                                                  : '');
                                        });
                                      }),
                                  Text("Medium",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.0,
                                          color: UtilColors.blackColor))
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: (physicalActivityLevel == 'Low')
                                          ? true
                                          : false,
                                      groupValue: true,
                                      onChanged: (value) {
                                        setState(() {
                                          physicalActivityLevel =
                                              ((value == false) ? 'Low' : '');
                                        });
                                      }),
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
                                  fontSize: 15.0,
                                  color: UtilColors.blackColor)),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      value: (lipidProfileLevel == 'High')
                                          ? true
                                          : false,
                                      groupValue: true,
                                      onChanged: (value) {
                                        setState(() {
                                          lipidProfileLevel =
                                              ((value == false) ? 'High' : '');
                                        });
                                      }),
                                  Text("High",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.0,
                                          color: UtilColors.blackColor))
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: (lipidProfileLevel == 'Medium')
                                          ? true
                                          : false,
                                      groupValue: true,
                                      onChanged: (value) {
                                        setState(() {
                                          lipidProfileLevel = ((value == false)
                                              ? 'Medium'
                                              : '');
                                        });
                                      }),
                                  Text("Medium",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.0,
                                          color: UtilColors.blackColor))
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: (lipidProfileLevel == 'Low')
                                          ? true
                                          : false,
                                      groupValue: true,
                                      onChanged: (value) {
                                        setState(() {
                                          lipidProfileLevel =
                                              ((value == false) ? 'Low' : '');
                                        });
                                      }),
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
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          UtilColors.blackColor),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          UtilColors.whiteColor),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    Map<String, dynamic> dataMap = {};
                                    dataMap['username'] = _username.text;
                                    dataMap['age'] = _age.text;
                                    dataMap['gender'] = selectedGender;
                                    dataMap['height'] = _height.text;
                                    dataMap['weight'] = _weight.text;
                                    dataMap['bodyfat'] = _bodyFat.text;
                                    dataMap['fastbloodsugar'] =
                                        _fastBloodSugar.text;
                                    dataMap['allegies'] = _allegies.text;
                                    dataMap['pal'] = physicalActivityLevel;
                                    dataMap['lp'] = lipidProfileLevel;

                                    Utils.dataMap = dataMap;

                                    _databaseRef
                                        .child("users")
                                        .child(Utils.profileUser.uid)
                                        .child('data')
                                        .set(Utils.dataMap)
                                        .then((value) {
                                      Utils.showToast('Profile Data Updated');
                                      Utils.doCalculation(context).then(
                                          (value) => Navigator.pop(context));
                                    });
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
