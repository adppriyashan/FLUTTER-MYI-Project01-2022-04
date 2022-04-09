import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Utils.dart';

class Confirmation extends StatefulWidget {

  var okFunction;

  Confirmation({required this.okFunction});

  @override
  State<StatefulWidget> createState() => ConfirmationState(okFunction:this.okFunction);
}

class ConfirmationState extends State<Confirmation>
    with SingleTickerProviderStateMixin {
var okFunction;
ConfirmationState({required this.okFunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: Utils.displaySize.width * 0.8,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirmation',
                      style: GoogleFonts.openSans(
                          fontSize: 15.0, color: UtilColors.primaryColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Record found. Do you want to edit personal details?',
                        style: GoogleFonts.openSans(
                            fontSize: 12.0, color: UtilColors.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: TextButton(
                              child: Text(
                                "No",
                                style: GoogleFonts.openSans(),
                              ),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        UtilColors.whiteColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        UtilColors.redColor),
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: TextButton(
                              child: Text(
                                "Yes",
                                style: GoogleFonts.openSans(),
                              ),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        UtilColors.whiteColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        UtilColors.greenColor),
                              ),
                              onPressed: okFunction,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
