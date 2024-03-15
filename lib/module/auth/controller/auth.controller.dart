import 'dart:developer';
import 'package:ekart/global/config/config.dart';
import 'package:ekart/global/styles/colors.dart';
import 'package:ekart/module/home/view/home.screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthController extends ChangeNotifier {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  Box<String> userInfo = Hive.box<String>(Config.dbName);
  bool isObscure = true;
  bool signUpLoader = false;
  onPasswordVisible(bool val) {
    isObscure = val;
    notifyListeners();
  }

  void registerUser(context) async {
    userInfo.put(Config().name, nameCtrl.text);
    signUpLoader = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      )
          .then((value) {
        if (value.user != null) {
          signUpLoader = false;
          notifyListeners();
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeScreen.route, (route) => true);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: kBlack,
          showCloseIcon: true,
          closeIconColor: kWhite,
          behavior: SnackBarBehavior.floating,
          content: Text("Account already exist. please login to continue"),
        ));
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  bool loginLoader = false;
  Future<void> loginUser(context) async {
    try {
      loginLoader = true;
      notifyListeners();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailCtrl.text, password: passwordCtrl.text)
          .then((value) async {
        if (value.user != null) {
          String? idToken = await value.user?.getIdToken();
          log(idToken.toString());
          userInfo.put('tokenKey', idToken!);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeScreen.route, (route) => true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: kBlack,
            showCloseIcon: true,
            closeIconColor: kWhite,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            content: const Text(
                "No user found for that email. Please sign up to continue"),
          ));
        }
        loginLoader = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kBlack,
          showCloseIcon: true,
          closeIconColor: kWhite,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          content: const Text("User not found for this mail id."),
        ));
        loginLoader = false;
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kBlack,
          showCloseIcon: true,
          closeIconColor: kWhite,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          content: const Text("Wrong password provided for that user."),
        ));
        loginLoader = false;
      } else if (e.code == 'too-many-requests') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kBlack,
          showCloseIcon: true,
          closeIconColor: kWhite,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          content: const Text(
              "Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later."),
        ));
        loginLoader = false;
      }
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  clearData() {
    passwordCtrl.clear();
    emailCtrl.clear();
    nameCtrl.clear();
  }
}
