import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myiproject/Controllers/Auth/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Utils.dart';
import 'package:myiproject/Views/Forms/DataForm.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final double topSpace = Utils.displaySize.width * 0.4;
  final ImagePicker _picker = ImagePicker();

  late DatabaseReference _databaseRef;

  @override
  void initState() {
    _databaseRef = FirebaseDatabase.instance.ref();
    super.initState();
  }

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
                        XFile? image =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (image != null && await image.length() > 0) {
                          print("Have an image");
                          print(await image.length());

                          submitImage(
                              file: File(image.path), filename: image.name);
                        } else {
                          print("Terminated");
                        }
                      },
                    ))
                  ],
                ),
              )
            ],
          )),
    ));
  }

  Future<void> submitImage(
      {required File file, required String filename}) async {
    await _databaseRef
        .child('users')
        .child(Utils.profileUser.uid)
        .child('data')
        .once()
        .then((value) {
      if (value.snapshot.exists) {
        Utils.showConfirmation(context, () {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => DataForm()));
        });
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DataForm()));
      }
    });

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse("10.0.2.2:5000"),
    // );
    // request.files.add(
    //   http.MultipartFile(
    //     'file',
    //     file.readAsBytes().asStream(),
    //     file.lengthSync(),
    //     filename: filename,
    //     contentType: MediaType('image', 'jpeg'),
    //   ),
    // );
    // request.headers.addAll({"Content-type": "multipart/form-data"});
    // var res = await request.send();

    // if (res.statusCode == 200) {
    //   var data = jsonDecode(res.toString());
    //   if (data['code'] == 200 && data['status'] == 'success') {
    //     if (data['data'] != null) {
    //       Utils.imageResponse = data['data'];

    //       await _databaseRef
    //           .child('users')
    //           .child(Utils.profileUser.uid)
    //           .child('data')
    //           .once()
    //           .then((value) {
    //         if (value.snapshot.exists) {
    //           Utils.showConfirmation(context, () {
        // Navigator.pop(context);
    //             Navigator.push(
    //                 context, MaterialPageRoute(builder: (_) => DataForm()));
    //           });
    //         } else {
    //           Navigator.push(
    //               context, MaterialPageRoute(builder: (_) => DataForm()));
    //         }
    //       });
    //     } else {
    //       Utils.showToast("Uploaded image processing failure.");
    //     }
    //   } else {
    //     Utils.showToast("Uploaded image processing failure.");
    //   }
    // } else {
    //   Utils.showToast("Uploaded image processing failure.");
    // }
  }
}
