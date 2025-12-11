import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mannai_user_app/utils/app_consts.dart';
import 'package:mannai_user_app/routing/app_router.dart';
import 'package:mannai_user_app/views/languagetoggle.dart';
import 'package:mannai_user_app/views/logoanimation.dart';
import 'package:mannai_user_app/views/onboarding/BottomCurveClipper.dart';
import 'package:mannai_user_app/views/onboarding/about_view.dart';

import 'package:mannai_user_app/widgets/buttons/primary_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: BottomCurveClipper(),
                  child: Container(
                    height: size.height * 0.45,
                    width: double.infinity,
                    color: AppColors.button_secondary,
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(top: 50, right: 20, child: LanguageView()),

                Positioned(
                  bottom: -170,
                  child: SizedBox(
                    height: 430,
                    width: 570,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            Image.asset("assets/icons/nadhil.png", height: 92),

            const SizedBox(height: 40),

            const LogoAnimation(),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppButton(
                text: "Get Started",
                onPressed: () {
                  // context.push(RouteNames.about);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AboutView()));

                },
                color: AppColors.btn_primery,
                width: double.infinity,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
