import 'package:myiproject/Models/FirebaseStructure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myiproject/Models/User.dart';
import 'package:myiproject/Models/Utils.dart';
import 'package:myiproject/Views/Auth/Login.dart';

class AuthController {
  static late FirebaseAuth _auth;
  late DatabaseReference _databaseRef;

  AuthController() {
    _auth = FirebaseAuth.instance;
    _databaseRef = FirebaseDatabase.instance.ref();
  }

  Future<bool> checkAuth() async {
    if (_auth.currentUser == null) {
      return false;
    } else {
      Utils.profileUser = await getUserData();

      return true;
    }
  }

  Future<dynamic> doDoctorRegistration(data) async {
    var key = null;

    await _auth
        .createUserWithEmailAndPassword(
      email: data['email'],
      password: data['password'],
    )
        .then((value) async {
      await _databaseRef
          .child(FirebaseStructure.USERS)
          .child(value.user!.uid)
          .set({
        'name': data['name'],
        'mobile': data['mobile'],
        'type': data['type']
      });

      key = value.user!.uid;
    }).catchError((e) {
      Utils.showToast(e.toString());
    });

    return key;
  }

  Future<void> doDoctorUpdate(userid, data) async {
    await _databaseRef.child(FirebaseStructure.USERS).child(userid).set(data);
  }

  Future<bool> doRegistration(data) async {
    bool check = true;

    await _auth
        .createUserWithEmailAndPassword(
      email: data['email'],
      password: data['password'],
    )
        .then((value) async {
      await _databaseRef
          .child(FirebaseStructure.USERS)
          .child(value.user!.uid)
          .set({
        'name': data['name'],
        'mobile': data['mobile'],
        'type': data['type']
      });

      Utils.showToast('Successfully Registered. Please Login Now.');
    }).catchError((e) {
      check = false;
      Utils.showToast(e.toString());
    });

    return check;
  }

  Future<bool> doLogin(data) async {
    bool check = true;

    await _auth
        .signInWithEmailAndPassword(
      email: data['email'],
      password: data['password'],
    )
        .catchError((e) {
      check = false;

      late String errorMessage;

      switch (e.code) {
        case 'invalid-email':
        case 'user-not-found':
        case 'wrong-password':
          errorMessage = 'Invalid credentails.';
          break;
        case 'user-disabled':
          errorMessage = 'Account has been disabled.';
          break;
        default:
          errorMessage = 'Something wrong.';
      }

      Utils.showToast(errorMessage);
    }).then((value) async {
      Utils.profileUser = await getUserData();
    });

    return check;
  }

  Future<void> logout(context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Login()));
  }

  Future<ProfileUser> getUserData() async {
    late ProfileUser user;
    if (_auth.currentUser != null) {
      await _databaseRef
          .child(FirebaseStructure.USERS)
          .child(_auth.currentUser!.uid)
          .once()
          .then((DatabaseEvent event) {
        Map<dynamic, dynamic> profileUserData = event.snapshot.value as Map;
        if (event.snapshot.value != null) {
          user = ProfileUser(
              name: profileUserData['name'],
              email: _auth.currentUser!.email,
              mobile: profileUserData['mobile'],
              type: profileUserData['type'],
              uid: _auth.currentUser!.uid);
        }
      });
    }
     

    return user;
  }

  Future<void> sendRecoverLink(email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
