import 'package:flutter/material.dart';

class DevPopup extends StatefulWidget {
  const DevPopup({super.key});

  @override
  State<DevPopup> createState() => _DevPopupState();
}

class _DevPopupState extends State<DevPopup> {
  double height = 0;

  void startAnimate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      height = MediaQuery.of(context).size.height * 0.7;
    });
  }

  @override
  void initState() {
    super.initState();
    startAnimate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 100),
        width: MediaQuery.of(context).size.width * 0.6,
        height: height,
        color: const Color.fromRGBO(12, 12, 12, 1.0),
        child: Stack(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(51, 51, 51, 1.0),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 4,
                    margin: const EdgeInsets.only(left: 7, top: 10),
                    padding: const EdgeInsets.only(left: 10, right: 2, top: 5),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(12, 12, 12, 1.0),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/cmd-logo.png",
                              width: 17,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "명령 프롬프트",
                              style: TextStyle(
                                fontFamily: "terminal",
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: const Icon(Icons.minimize, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      const Icon(Icons.crop_din, color: Colors.white, size: 15),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close,
                            color: Colors.white, size: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 15),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const TerminalContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TerminalContent extends StatefulWidget {
  const TerminalContent({super.key});

  @override
  State<TerminalContent> createState() => _TerminalContentState();
}

class _TerminalContentState extends State<TerminalContent> {
  List<Widget> result = [];
  String content =
      "Microsoft Windows [Version 10.0.26100.2605]\n(c) Microsoft Corporation. All rights reserved.\n\nC:\\Users\\조형구>";

  void cursorAnimate() async {
    while (true) {
      setState(() {
        if (content[content.length - 1] != "|") {
          content += "|";
        } else {
          content = content.substring(0, content.length - 1);
        }
      });
      if (content[content.length - 1] == "\n") {
        content += "|";
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          content = content.substring(0, content.length - 1);
        });
        getResult();
        break;
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  Future typeAnimate() async {
    content += " ";
    for (String c in "show 개발 스펙\n".split("")) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        content = content.substring(0, content.length - 1);
        content += "$c|";
      });
    }
  }

  void getResult() async {
    List<Widget> outputList = [
      const Text(
        "WEB CRAWLING",
        style: TextStyle(
          fontFamily: "terminal",
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset("assets/python-logo.png", width: 100),
            const SizedBox(width: 15),
            Image.asset("assets/nodejs-logo.png", width: 100),
          ],
        ),
      ),
      const Text(
        "< 데이터 모니터링 회사에서 \"웹 크롤러 개발자\" 2년 경력 >",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
      const Text(
        "주업무: 웹 상에 떠도는 불법 데이터들을 수집 및 신고 자동화\n크롤러 제작에 사용한 언어: Python, NodeJS\n업무 방식:\n데이터 수집 알고리즘 작성 후 작업스케줄러를 이용해 하루 평균 2만 개 데이터 자동 수집, 이후 DB에서 데이터 유지보수",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 15),
      const Text(
        "DATABASE",
        style: TextStyle(
          fontFamily: "terminal",
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset("assets/mysql-logo.png", width: 100),
            const SizedBox(width: 15),
            Image.asset("assets/mongodb-logo.png", width: 100),
            const SizedBox(width: 15),
            Image.asset("assets/typescript-logo.png", width: 100),
          ],
        ),
      ),
      const Text(
        "< \"웹 개발 백엔드\" 2년 경력 >",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
      const Text(
        "TypeScript를 이용하여 CRUD API 제작\n서비스의 client는 회사 내의 운영팀, 운영팀의 피드백을 반영하여 웹 기능 유지보수\nEx) 데이터가 유실되거나 손상되면 Query 이용하여 일괄 Update 및 Insert, 프론트엔드 인력이 모자르면 대신 웹 UI 수정 (Javascript)",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 15),
      const Text(
        "WEB DEPLOY",
        style: TextStyle(
          fontFamily: "terminal",
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          children: [
            Image.asset("assets/netlify-logo.png", width: 100),
            const SizedBox(width: 15),
            Image.asset("assets/aws-logo.png", width: 100),
            const SizedBox(width: 15),
            Image.asset("assets/flutter-logo.png", width: 100),
          ],
        ),
      ),
      const Text(
        "서버 배포 관련해서\nNetlify는 무료이기에 개인적으로 많이 사용하고, AWS는 회사나 프로젝트에서만 살짝 맛보기로 경험\n웹, 앱을 1인 개발 하고 싶을 때는 Flutter를 이용하여 제작\n(현재 사이트 Flutter 제작 및 Netlify 배포)",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 15),
      const Text(
        "Game Develop",
        style: TextStyle(
          fontFamily: "terminal",
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          children: [
            Image.asset("assets/unity-logo.png", width: 150),
            const SizedBox(width: 15),
            Image.asset("assets/firebase-logo.png", width: 150),
          ],
        ),
      ),
      const Text(
        "Unity 프로젝트와 1, 2학년 Unity 전공 수업 경험\n(Unity 클라이언트 개발, C# 스크립트, Firebase DB 사용)\n메타버스 수업을 통해 부실했던 게임 개발의 경험을 쌓고 Unreal 엔진도 사용할 수 있는 인재가 되고 싶습니다.",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 30),
      const Text(
        "...",
        style: TextStyle(
          fontFamily: "terminal",
          color: Colors.white,
        ),
      ),
    ];
    for (Widget output in outputList) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        result.add(output);
      });
    }
  }

  void animate() async {
    await typeAnimate();
    cursorAnimate();
  }

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "terminal",
            ),
          ),
          ...result,
        ],
      ),
    );
  }
}
