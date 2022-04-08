import 'package:image_picker/image_picker.dart';
import 'package:myiproject/Controllers/Auth/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final double topSpace = Utils.displaySize.width * 0.4;
  final ImagePicker _picker = ImagePicker();
  late final XFile? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
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
                  'assets/img/home.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: Utils.displaySize.height * 0.08,
                width: Utils.displaySize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => AuthController().logout(context),
                      child: Container(
                        decoration: BoxDecoration(
                            color: UtilColors.primaryColor,
                            borderRadius: BorderRadius.circular(100.0)),
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.logout,
                          color: UtilColors.whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Utils.displaySize.height,
                width: Utils.displaySize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Utils.displaySize.width * 0.9,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: getEmptyData(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                        child: TextButton(
                      child: Text(
                        "CAPTURE IMAGE",
                        style: GoogleFonts.openSans(),
                      ),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            UtilColors.whiteColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            UtilColors.primaryColor),
                      ),
                      onPressed: () async {
                        image ??=
                            await _picker.pickImage(source: ImageSource.camera);
                        


                      },
                    ))
                  ],
                ),
              )
            ],
          )),
    ));
  }

  getEmptyData() {
    return Text(
      'Please upload image to scan facts',
      style: TextStyle(color: UtilColors.greyColor, fontSize: 12.0),
    );
  }

  getPredictionData(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        const Text('Prediction Data'),
        Divider(),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Prediction Data : 123',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Prediction Data : 123',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Prediction Data : 123',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Prediction Data : 123',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}
