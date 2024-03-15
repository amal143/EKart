import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../global/config/config.dart';
import '../../../global/dimensions/dimensions.dart';
import '../../../global/styles/colors.dart';
import '../../../global/widgets/common_btton.widget.dart';
import '../../../global/widgets/common_textfield.widget.dart';
import '../controller/auth.controller.dart';
import 'sign_up.screen.dart';

class SignInScreen extends StatelessWidget {
  static const route = '/signIn';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, authCtrl, _) {
      return Scaffold(
        backgroundColor: kBgColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'E-Kart',
                  style: GoogleFonts.urbanist(
                      color: kPrimary,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: kWhite),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 25.h),
                    child: Column(
                      children: [
                        Text(
                          'Sign In',
                          style: GoogleFonts.urbanist(
                              color: kBlack,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        KDimensions().sHeight(ht: 20.h),

                        //*-- Email text filed
                        CommonTextFieldWidget(
                            keyboardType: TextInputType.emailAddress,
                            label: 'E-mail',
                            validator: (value) {
                              return null;
                            },
                            controller: authCtrl.emailCtrl),
                        KDimensions().sHeight(ht: 15.h),

                        //*-- Password text filed
                        CommonTextFieldWidget(
                            keyboardType: TextInputType.visiblePassword,
                            label: 'Password',
                            maxLines: 1,
                            obscureText: authCtrl.isObscure ? true : false,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  if (authCtrl.isObscure) {
                                    authCtrl.onPasswordVisible(false);
                                  } else {
                                    authCtrl.onPasswordVisible(true);
                                  }
                                },
                                child: Icon(authCtrl.isObscure
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash)),
                            validator: (value) {
                              return null;
                            },
                            controller: authCtrl.passwordCtrl),
                        KDimensions().sHeight(ht: 30.h),
                        CommonButtonWidget(
                            isLoading: authCtrl.loginLoader,
                            onTap: () {
                              authCtrl.loginUser(context);
                            },
                            bgColor: kPrimary,
                            txtColor: kWhite,
                            title: "Sign In",
                            height: 45,
                            width: size.width * 0.8),
                        KDimensions().sHeight(ht: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Does not have an account? ',
                              style: GoogleFonts.urbanist(
                                  color: kBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    SignUpScreen.route, (route) => true);
                              },
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.urbanist(
                                    color: kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
