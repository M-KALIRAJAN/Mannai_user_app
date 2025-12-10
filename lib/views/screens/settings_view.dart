import 'package:flutter/material.dart';
import 'package:mannai_user_app/utils/app_consts.dart';
import 'package:mannai_user_app/widgets/app_back.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isToggleOn = false;
  @override
  Widget Settinglist(String text, Image preficon, Icon icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(76, 149, 129, 0.4),
              ),
              child: preficon,
            ),
            SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        icon,
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_clr,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 20,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCircleIconButton(icon: Icons.arrow_back, onPressed: () {}),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(""),
                  Text('')
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Settinglist(
                      "About App",
                      Image.asset("assets/icons/i.png"),
                      Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    ),
                    SizedBox(height: 15),
                    Settinglist(
                      "Help & Support",
                      Image.asset("assets/icons/help.png"),
                      Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    ),
                    SizedBox(height: 15),
                    // Settinglist(
                    //   "",
                    //   Image.asset("assets/icons/help.png"),
                    //   Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    // ),
    Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(76, 149, 129, 0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/icons/help.png"),
          ),
        ),
        SizedBox(width: 15),
        Text(
          "Notification",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),

    //  TOGGLE BUTTON
    GestureDetector(
      onTap: () {
        setState(() {
          isToggleOn = !isToggleOn;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 45,
        height: 25,
        padding: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isToggleOn ? AppColors.btn_primery : Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 200),
          alignment:
              isToggleOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    ),
  ],
)
,
                    SizedBox(height: 15),
                    Settinglist(
                      "Change Language",
                      Image.asset("assets/icons/global.png"),
                      Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    ),
                    SizedBox(height: 15),
                    Settinglist(
                      "History",
                      Image.asset("assets/icons/help.png"),
                      Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    ),
                    SizedBox(height: 15),
                    Settinglist(
                      "Privacy Policy",
                      Image.asset("assets/icons/help.png"),
                      Icon(Icons.arrow_forward_ios_outlined, size: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Settinglist(
                  "Log Out",
                  Image.asset("assets/icons/help.png"),
                  Icon(Icons.arrow_forward_ios_outlined, size: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
