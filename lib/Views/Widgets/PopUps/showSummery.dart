import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Utils.dart';

class showSummery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => showSummeryState();
}

class showSummeryState extends State<showSummery>
    with SingleTickerProviderStateMixin {
  int summary1 = 1, summary2 = 1, summary3 = 1, summary4 = 0;
  List statusList = ['Not Specified', 'OK', 'NOT BAD', 'BAD'];
  List colorList = [
    UtilColors.primaryColor,
    UtilColors.greenColor,
    UtilColors.orangeColor,
    UtilColors.redColor
  ];
  double bmi = 0.0;

  @override
  void initState() {
    double weight = double.parse(Utils.dataMap['weight']);
    double height = double.parse(Utils.dataMap['height']);
    bmi = weight / (height * height);
    setState(() {
      if (Utils.fatValue == 0.0) {
        summary1 = 0;
      } else {
        if (Utils.dataMap['pal'] == 'Medium' ||
            Utils.dataMap['pal'] == 'High') {
          if ((double.parse(Utils.dataMap['fastbloodsugar']) < 100 &&
                  Utils.carbsValue > 25) ||
              (Utils.dataMap['lp'] == 'Low' && Utils.fatValue > 35)) {
            summary1 = 2;
          }
        }
      }

      if (Utils.fatValue == 0.0) {
        summary2 = 0;
      } else {
        if ((Utils.dataMap['lp'] == 'Low' && Utils.fatValue > 6) ||
            ((Utils.dataMap['lp'] == 'Low' ||
                    Utils.dataMap['lp'] == 'Medium') &&
                Utils.fatValue > 35)) {
          summary2 = 2;
        }
      }

      if (Utils.carbsValue == 0.0) {
        summary3 = 0;
      } else {
        if ((Utils.carbsValue > 10 &&
                double.parse(Utils.dataMap['fastbloodsugar']) > 120) ||
            (Utils.carbsValue > 15 &&
                double.parse(Utils.dataMap['fastbloodsugar']) > 100) ||
            (Utils.carbsValue > 25 &&
                double.parse(Utils.dataMap['fastbloodsugar']) < 100)) {
          summary3 = 3;
        }
      }

      if (Utils.fatValue == 0.0) {
        summary4 = 0;
      } else {
        if (Utils.fatValue > 30 || bmi > 25) {
          summary4 = 2;
        }
      }
    });
    super.initState();
  }

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
                      'Summary',
                      style: GoogleFonts.openSans(
                          fontSize: 15.0, color: UtilColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        'physical activity medium or high , then Fasting blood sugar < 100 and carbohydrates percentage > 25%'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: colorList[summary1]),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: Text(statusList[summary1],
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.whiteColor)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        'Lipid High and Fat > 6 % = bad  , Lipid Normal or Low and Fat > 35%'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: colorList[summary2]),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: Text(statusList[summary2],
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.whiteColor)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        'Fasting blood sugar > 120 and Carbohydrates percentage > 10 % = bad , Fasting Blood Sugar > 100 and Carbohydrates percentage > 15 % =  bad , Fasting Blood Sugar < 100 and Carbohydrates percentage > 25 %'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: colorList[summary3]),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: Text(statusList[summary3],
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.whiteColor)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text('Fat > 30 or BMI > 25'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: colorList[summary4]),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: Text(statusList[summary4],
                          style: GoogleFonts.openSans(
                              fontSize: 15.0, color: UtilColors.whiteColor)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.openSans(),
                        ),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              UtilColors.whiteColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              UtilColors.redColor),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    )
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
