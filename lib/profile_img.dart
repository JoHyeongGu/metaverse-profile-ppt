import 'package:flutter/material.dart';
import 'package:metaverse_profile_ppt/profile_popup.dart';

class ProfileImg extends StatefulWidget {
  const ProfileImg({super.key});

  @override
  State<ProfileImg> createState() => _ProfileImgState();
}

class _ProfileImgState extends State<ProfileImg> {
  bool focus = false;

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
        onTapCancel: (){
          setState(() {
            focus = false;
          });
        },
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return const ProfilePopup();
            },
          );
        },
        child: SizedBox(
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              focus ? "assets/pixel_me.gif" : "assets/pixel_me.png",
            ),
          ),
        ),
      ),
    );
  }
}
