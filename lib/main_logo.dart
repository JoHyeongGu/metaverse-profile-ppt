import 'package:flutter/material.dart';
import 'package:metaverse_profile_ppt/profile_img.dart';

class MainLogo extends StatefulWidget {
  const MainLogo({super.key});

  @override
  State<MainLogo> createState() => _MainLogoState();
}

class _MainLogoState extends State<MainLogo> {
  String title = "Metaverse Development";
  String subTitle = "Introduce Myself";

  Text logoText(String content, double size) {
    return Text(
      content,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
        fontFamily: "pixel_dung",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ProfileImg(),
        logoText(title, 30),
        logoText(subTitle, 20),
      ],
    );
  }
}
