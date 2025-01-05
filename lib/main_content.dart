import 'dart:math';
import 'package:flutter/material.dart';
import 'package:metaverse_profile_ppt/art_popup.dart';
import 'package:metaverse_profile_ppt/dev_popup.dart';
import 'package:metaverse_profile_ppt/main_logo.dart';
import 'package:metaverse_profile_ppt/menu_btn.dart';
import 'package:metaverse_profile_ppt/music_popup.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromRGBO(56, 69, 58, 1.0),
        ),
        MediaQuery.of(context).size.width < 500 ||
                MediaQuery.of(context).size.height < 300
            ? const MobileContent()
            : const DesktopContent(),
      ],
    );
  }
}

class DesktopContent extends StatefulWidget {
  const DesktopContent({super.key});

  @override
  State<DesktopContent> createState() => _DesktopContentState();
}

class _DesktopContentState extends State<DesktopContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: MainLogo(),
        ),
        // left top
        Positioned(
          left: MediaQuery.of(context).size.width / 4 - 100,
          top: MediaQuery.of(context).size.height / 2 - 250,
          child: const MenuBtn(
            imgPath: "assets/dev_icon.png",
            gifPath: "assets/dev_icon.gif",
            title: "Develop",
            dialog: DevPopup(),
          ),
        ),
        // left bottom
        Positioned(
          left: MediaQuery.of(context).size.width / 4 - 150,
          top: MediaQuery.of(context).size.height / 2 + 50,
          child: const MenuBtn(
            imgPath: "assets/art_icon.png",
            gifPath: "assets/art_icon.gif",
            title: "Art",
            dialog: ArtPopup(),
          ),
        ),
        // right top
        Positioned(
          right: MediaQuery.of(context).size.width / 4 - 150,
          top: MediaQuery.of(context).size.height / 2 - 220,
          child: const MenuBtn(
            imgPath: "assets/music_icon.png",
            gifPath: "assets/music_icon.gif",
            title: "Music",
            dialog: MusicPopup(),
          ),
        ),
        // right bottom
        Positioned(
          right: MediaQuery.of(context).size.width / 4 - 100,
          top: MediaQuery.of(context).size.height / 2 + 60,
          child: MenuBtn(
            imgPath: "assets/fav_icon.png",
            gifPath: "assets/fav_icon.gif",
            title: "Favorite",
            dialog: Container(
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}

class MobileContent extends StatefulWidget {
  const MobileContent({super.key});

  @override
  State<MobileContent> createState() => _MobileContentState();
}

class _MobileContentState extends State<MobileContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MainLogo(),
              const SizedBox(height: 100),
              SizedBox(
                height: 300,
                child: MenuBtn(
                  imgPath: "assets/dev_icon.png",
                  gifPath: "assets/dev_icon.gif",
                  title: "Develop",
                  dialog: Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: MenuBtn(
                  imgPath: "assets/art_icon.png",
                  gifPath: "assets/art_icon.gif",
                  title: "Art",
                  dialog: Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: MenuBtn(
                  imgPath: "assets/music_icon.png",
                  gifPath: "assets/music_icon.gif",
                  title: "Music",
                  dialog: Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: MenuBtn(
                  imgPath: "assets/fav_icon.png",
                  gifPath: "assets/fav_icon.gif",
                  title: "Favorite",
                  dialog: Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
