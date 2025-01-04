import 'package:flutter/material.dart';

class ProfilePopup extends StatefulWidget {
  const ProfilePopup({super.key});

  @override
  State<ProfilePopup> createState() => _ProfilePopupState();
}

class _ProfilePopupState extends State<ProfilePopup> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/pixel_me.gif"),
                ),
              ),
              const AnimatedText(),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool padding = false;
  String input = '''< TMI Zone >
  
이름: 조형구
고향: 20년 파주 토박이
혈액형: B형
키: 183 / 몸무게: 90KG
생일: 2001. 10. 24
전공: 게임소프트웨어 20학번
MBTI: 휴식기 ENTP / 활동기 ENTJ''';
  String content = "";

  void animating() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      padding = true;
    });
    for (String c in input.split("")) {
      setState(() {
        content += c;
      });
      await Future.delayed(const Duration(milliseconds: 40));
    }
  }

  @override
  void initState() {
    super.initState();
    animating();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.only(left: padding ? 30 : 0),
      child: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "pixel_dung",
          fontSize: 16,
        ),
      ),
    );
  }
}
