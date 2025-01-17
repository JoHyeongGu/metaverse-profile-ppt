import 'package:flutter/material.dart';
import 'package:youtube_player_iframe_plus/youtube_player_iframe_plus.dart';

class MusicPopup extends StatefulWidget {
  const MusicPopup({super.key});

  @override
  State<MusicPopup> createState() => _MusicPopupState();
}

class _MusicPopupState extends State<MusicPopup> {
  double mainBottom = -600;

  void mainStart() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      mainBottom = MediaQuery.of(context).size.height / 2 -
          MediaQuery.of(context).size.height * 0.7 / 2;
    });
  }

  @override
  void initState() {
    super.initState();
    mainStart();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        AnimatedBackIcon(
          name: "music_yellow_back",
          width: 300,
          left: 100,
          bottom: MediaQuery.of(context).size.height - 400,
        ),
        AnimatedBackIcon(
          name: "music_blue_back",
          width: 400,
          left: MediaQuery.of(context).size.width - 300,
          bottom: -100,
          delay: 300,
        ),
        AnimatedBackIcon(
          name: "music_red_back",
          width: 200,
          left: MediaQuery.of(context).size.width - 300,
          bottom: MediaQuery.of(context).size.height - 300,
          delay: 700,
        ),
        const AnimatedBackIcon(
          name: "music_guitar_back",
          width: 350,
          left: 0,
          bottom: 0,
          delay: 1000,
          startLeft: -500,
          startBottom: -500,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
          left: MediaQuery.of(context).size.width / 2 - 370,
          bottom: mainBottom,
          child: const MainMusicContent(),
        ),
      ],
    );
  }
}

class AnimatedBackIcon extends StatefulWidget {
  final String name;
  final double width;
  final double left;
  final double bottom;
  final double startLeft;
  final double startBottom;
  final int delay;
  const AnimatedBackIcon({
    super.key,
    required this.name,
    required this.width,
    this.left = 0,
    this.bottom = 0,
    this.startLeft = -200,
    this.startBottom = -200,
    this.delay = 0,
  });

  @override
  State<AnimatedBackIcon> createState() => _AnimatedBackIconState();
}

class _AnimatedBackIconState extends State<AnimatedBackIcon> {
  late double bottom;
  late double left;

  void startAnimate() async {
    await Future.delayed(Duration(milliseconds: widget.delay));
    setState(() {
      left = widget.left;
      bottom = widget.bottom;
    });
  }

  @override
  void initState() {
    super.initState();
    bottom = widget.startBottom;
    left = widget.startLeft;
    startAnimate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: left,
      bottom: bottom,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutQuart,
      child: Opacity(
        opacity: 0.7,
        child: Image.asset(
          "assets/${widget.name}.png",
          width: widget.width,
        ),
      ),
    );
  }
}

class MainMusicContent extends StatefulWidget {
  const MainMusicContent({super.key});

  @override
  State<MainMusicContent> createState() => _MainMusicContentState();
}

class _MainMusicContentState extends State<MainMusicContent> {
  YoutubePlayerController videoController = YoutubePlayerController(
    initialVideoId: 'wZmLRryYG3Y',
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: false,
    ),
  );

  YoutubePlayerController videoController2 = YoutubePlayerController(
    initialVideoId: 'CO-vR7DMUbk',
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: false,
    ),
  );

  YoutubePlayerController videoController3 = YoutubePlayerController(
    initialVideoId: 'L8p03JX2s3M',
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/akbo.png",
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "< 가벼운 음악 취미 >",
                    style: TextStyle(
                      fontFamily: "chosun_pen",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/music_device.jpg",
                        width: MediaQuery.of(context).size.width / 8,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "오디오 인터페이스를 이용해 홈레코딩\n" +
                            "오인페: 음향을 더 세밀히 조절할 수 있게 해주고\n효과를 넣을 수 있게 해주는 기기",
                        style: TextStyle(
                          fontFamily: "chosun_pen",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/studio-one.png",
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      const SizedBox(width: 15),
                      Image.asset(
                        "assets/music-line.png",
                        width: MediaQuery.of(context).size.width / 12,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "다양한 프로그램으로\n레코딩, 작곡, 믹싱을 연구하고 시도하는 중\n" +
                            "PC: Studio One 5 Prime (믹싱) |\nMobile: MusicLine (작곡)",
                        style: TextStyle(
                          fontFamily: "chosun_pen",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "< 게임 BGM 제작 >",
                    style: TextStyle(
                      fontFamily: "chosun_pen",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: YoutubePlayerIFramePlus(
                          controller: videoController,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "MusicLine 어플로 작곡하고\n픽셀아트를 그려서 비디오 리소스로 제작",
                        style: TextStyle(
                          fontFamily: "chosun_pen",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "< 대학생 작곡 콘텐스트 참여 >",
                    style: TextStyle(
                      fontFamily: "chosun_pen",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: YoutubePlayerIFramePlus(
                          controller: videoController2,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "온라인 콘테스트에 참여 후 수상식에 참여해서 무대 녹화 진행\n이후 개최측 모회사에 산업기능요원으로 개발자 취직",
                        style: TextStyle(
                          fontFamily: "chosun_pen",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "< 애니메이션 더빙 믹싱 >",
                    style: TextStyle(
                      fontFamily: "chosun_pen",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: YoutubePlayerIFramePlus(
                          controller: videoController3,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "코등학생때 성우를 꿈꿨던 기억이 있어\n믹싱 기술을 활용해 애니메이션을 더빙해보는 취미 생활",
                        style: TextStyle(
                          fontFamily: "chosun_pen",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
