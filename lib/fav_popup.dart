import 'package:flutter/material.dart';

class FavPopup extends StatefulWidget {
  const FavPopup({super.key});

  @override
  State<FavPopup> createState() => _FavPopupState();
}

class _FavPopupState extends State<FavPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "List<좋아하는 것들>",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/fav_game.gif",
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Flexible(
                      child: Text(
                        "게임 (Game)\n게임하는 것을 좋아한다.\n주로 Steam에 있는 게임들을 즐겨 하고\n간단히 할 수 있는 모바일 게임도 자주 한다.\nVR게임도 즐겨 한다.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/fav_food.jpg",
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Flexible(
                      child: Text(
                        "맛집 (Food)\n맛있는 맛집을 찾아 떠나는 것을 좋아한다.\n맛집을 발견할 때마다\n네이버 지도에 내 장소로 등록하여\n네이버 지도를 열면 하트로 가득하다.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/fav_trip.jpg",
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Flexible(
                      child: Text(
                        "여행 (Travel)\n여행하는 것을 좋아해서 가족들과 여행을 아주 많이 하고\n최근에는 혼자서 8일간 제주도에 다녀왔다.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/fav_cafe.jpg",
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Flexible(
                      child: Text(
                        "카페 (cafe)\n카페에 돌아다니는 것을 좋아한다.\n매번 새로운 카페를 찾아 돌아다닌다.\n아메리카노를 가장 좋아한다.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/fav_camp.jpg",
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Flexible(
                      child: Text(
                        "캠핑 (camping)\n아버지와 자주 캠핑을 다닌다.\n텐트를 치고 불을 피우고 자연속에서 맛있는 것을 먹는 것은 행복하다.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
