import 'package:flutter/material.dart';

class ArtPopup extends StatefulWidget {
  const ArtPopup({super.key});

  @override
  State<ArtPopup> createState() => _ArtPopupState();
}

class _ArtPopupState extends State<ArtPopup> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        Center(
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 -
                        MediaQuery.of(context).size.width / 6),
                Image.asset(
                  "assets/jagubjajok.png",
                  width: MediaQuery.of(context).size.width / 3,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/sketchbook_icon.png",
                  width: MediaQuery.of(context).size.width / 8,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/aesprite_icon.png",
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/pixel_me.gif",
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "assets/snake_pixel.gif",
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "assets/duck_pixel.gif",
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/developing-balls.gif",
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/pen_mom.jpg",
                  width: MediaQuery.of(context).size.width / 5,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/pen_friends.jpg",
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  "assets/3d_art.gif",
                  width: MediaQuery.of(context).size.width / 3,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 2),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 2 - 30,
          child: IconButton(
            onPressed: () {
              _controller.animateTo(
                _controller.offset - 500,
                duration: const Duration(seconds: 3),
                curve: Curves.easeOutQuart,
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height / 2 - 30,
          child: IconButton(
            onPressed: () {
              _controller.animateTo(
                _controller.offset + 500,
                duration: const Duration(seconds: 3),
                curve: Curves.easeOutQuart,
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
