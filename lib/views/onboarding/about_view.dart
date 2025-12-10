import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mannai_user_app/utils/app_consts.dart';
import 'package:mannai_user_app/routing/app_router.dart';
import 'package:mannai_user_app/widgets/app_back.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  // Only the text content changes
  final List<String> textPages = [
    """We are pleased to welcome you to NAQI BAHRAIN SERVICES, an innovative community project that aims to support families across Bahraini society and ease their financial burdens by providing high-quality and free services that enhance your daily experience."""
        """Our mission is to ensure that all members benefit in a fair and organized manner, while promoting the spirit of cooperation and community participation."""
        """We aim to promote the spirit of cooperation and community participation, so that everyone in Bahraini society can enjoy the benefits of our services in an organized and convenient way."""
        """We aim to promote the spirit of cooperation and community participation, so that everyone in Bahraini society can enjoy the benefits of our services in an organized and convenient way."""
        """We aim to promote the spirit of cooperation and community participation, so that everyone in Bahraini society can enjoy the benefits of our services in an organized and convenient way.""",
    """We aim to promote the spirit of cooperation and community participation, so that everyone in Bahraini society can enjoy the benefits of our services in an organized and convenient way.""",
    """We aim to promote the spirit of cooperation and community participation, so that everyone in Bahraini society can enjoy the benefits of our services in an organized and convenient way.""",
  ];

  void nextPage() {
    if (currentIndex < textPages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _controller.jumpToPage(0); // loop back to first
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                          Colors.white.withOpacity(0),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                           context.push(RouteNames.login);
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: AppColors.btn_primery,
                                    fontSize: 12,
                                    fontFamily: "Poppins",
                                  ),
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
          Text(
            "Nadi Bahrain Services",
            style: TextStyle(
              fontSize: AppFontSizes.xLarge,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _controller,
              itemCount: textPages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
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
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Row(
                  children: List.generate(
                    textPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? AppColors.btn_primery
                            : AppColors.btn_primery.withOpacity(0.4),
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
