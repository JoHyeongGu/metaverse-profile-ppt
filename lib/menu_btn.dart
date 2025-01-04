import 'dart:math';
import 'package:flutter/material.dart';

class MenuBtn extends StatefulWidget {
  final String imgPath;
  final String gifPath;
  final String title;
  final Widget dialog;

  const MenuBtn({
    super.key,
    required this.imgPath,
    required this.gifPath,
    required this.title,
    required this.dialog,
  });

  @override
  State<MenuBtn> createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> {
  bool focus = false;
  double rope = 30;

  void floatAnimation() async {
    while (true) {
      setState(() {
        if (rope == 0) {
          rope = Random().nextDouble() * 70;
        } else {
          rope = 0;
        }
      });
      await Future.delayed(Duration(seconds: Random().nextInt(5) + 2));
    }
  }

  @override
  void initState() {
    super.initState();
    floatAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        setState(() {
          focus = true;
        });
      },
      onExit: (details) {
        setState(() {
          focus = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return widget.dialog;
            },
          );
        },
        onTapDown: (details) {
          setState(() {
            focus = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            focus = false;
          });
        },
        onTapCancel: () {
          setState(() {
            focus = false;
          });
        },
        child: Column(
          children: [
            Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 3),
              width: 10,
              height: rope,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ...List.filled(3, Colors.brown),
                    ...List.filled(3, const Color.fromRGBO(120, 104, 95, 1.0)),
                    ...List.filled(3, Colors.brown),
                    const Color.fromRGBO(50, 42, 38, 1.0),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      focus ? widget.gifPath : widget.imgPath,
                      width: 150,
                    ),
                  ),
                  if (focus)
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "pixel_dung",
                        fontSize: 20,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
