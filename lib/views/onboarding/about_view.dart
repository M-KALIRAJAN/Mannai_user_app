import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mannai_user_app/core/constants/app_consts.dart';
import 'package:mannai_user_app/core/utils/logger.dart';
import 'package:mannai_user_app/services/onbording_service.dart';
import 'package:mannai_user_app/views/auth/login_view.dart';
import 'package:mannai_user_app/widgets/app_back.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final PageController _controller = PageController();

  int currentIndex = 0;
  bool isLoading = true;
  final List<String> textPages = [];

  @override
  void initState() {
    super.initState();
    loadAbout();
  }

  Future<void> loadAbout() async {
    final aboutData = await OnbordingService().fetchAbout();

    AppLogger.warn(jsonEncode(aboutData));

    if (aboutData != null &&
        aboutData["data"] != null &&
        aboutData["data"]["content"] is List) {
      // textPages.clear();
      textPages.addAll(
        List<String>.from(aboutData["data"]["content"]),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void nextPage() {
    if (currentIndex < textPages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// TOP IMAGE
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/about.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color.fromARGB(0, 241, 238, 238),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 15,
                  right: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCircleIconButton(
                        icon: Icons.arrow_back,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: AppFontSizes.medium,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginView(),
                            ),
                          );
                        },
                        child: Container(
                          height: 25,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Skip",
                                style: TextStyle(
                                  color: AppColors.btn_primery,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                "assets/icons/skip.png",
                                height: 14,
                                width: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// TITLE
          Text(
            "Nadi Bahrain Services",
            style: TextStyle(
              fontSize: AppFontSizes.xLarge,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),

          const SizedBox(height: 10),

          /// CONTENT
          SizedBox(
            height: 250,
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : PageView.builder(
                    controller: _controller,
                    itemCount: textPages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          textPages[index],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: AppFontSizes.small,
                            height: 1.5,
                            fontFamily: "Poppins",
                            color: Colors.black87,
                          ),
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 20),

       
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Row(
                  children: List.generate(
                    textPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? AppColors.btn_primery
                            : AppColors.btn_primery.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: nextPage,
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.button_secondary,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
