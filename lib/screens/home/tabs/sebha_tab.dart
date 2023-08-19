import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_hti/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../providers/app_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  int counter = 0;
  int numberTasbeh = 0;
  String? zeker = " ";
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    setRotatation(10);
  }

  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void setRotatation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              Container(
                height: 312,
                width: 230,
                color: Colors.transparent,
              ),
              Positioned(
                child: Image(
                    image: AssetImage(
                        Provider.of<AppProvider>(context).isDarkThemeEnabled
                            ? "assets/head_sebha_dark.png"
                            : "assets/head_sebha_logo.png")),
                top: 0,
                left: 100,
              ),
              Positioned(
                child: AnimatedBuilder(
                  animation: animation,
                  child: Image(
                      image: AssetImage(
                          Provider.of<AppProvider>(context).isDarkThemeEnabled
                              ? "assets/body_sebha_dark.png"
                              : "assets/body_sebha_logo.png")),
                  builder: (context, child) =>
                      Transform.rotate(angle: animation.value, child: child),
                ),
                bottom: 5,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "thenumber of praises",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 21),
        ),
        Center(
            child: Container(
              height: 65,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Provider.of<AppProvider>(context).isDarkThemeEnabled
                    ? Color(0xFF0F1424)
                    : AppColors.primiaryColor,
              ),
              child: Center(
                  child: Text(
                    "${numberTasbeh}",
                    style: TextStyle(fontSize: 26),
                  )),
            )),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: GestureDetector(
              child: Container(
                height: 55,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Provider.of<AppProvider>(context).isDarkThemeEnabled
                      ? AppColors.primiaryDarkColor
                      : AppColors.primiaryColor,
                ),
                child: Center(
                    child: Text(
                      "$zeker",
                      style: TextStyle(fontSize: 26),
                    )),
              ),
              onTap: () {
                controller.forward(from: 0);
                setState(() {
                  counter++;
                  if (counter <= 99) {
                    tasbeh();
                    zeker = tasbeh();
                  } else {
                    counter = 1;
                    tasbeh();
                    zeker = tasbeh();
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  String tasbeh() {
    int turn = 1;
    String zeker = "";
    if (counter <= 33) {
      numberTasbeh = counter;
      zeker = "subhanalah";
    } else if (counter <= 66) {
      numberTasbeh = counter - 33;
      zeker = "elhamdlilah";
    } else if (counter <= 99) {
      numberTasbeh = counter - 66;
      zeker = " allahakbar";
    } else {}

    return zeker;
  }
}