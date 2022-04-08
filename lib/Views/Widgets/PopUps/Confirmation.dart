import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Utils.dart';

class Confirmation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConfirmationState();
}

class ConfirmationState extends State<Confirmation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          child: Card(
            child: Column(
              children: [Text('Confirmation')],
            ),
          ),
        ),
      ),
    );
  }
}
