import 'package:ball_sliding/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/dimensions.dart';
import '../widgets/tr_icon_button.dart';
import 'ball_sliding.dart';

class BallSidingScreen extends StatefulWidget {
  const BallSidingScreen({Key? key}) : super(key: key);

  @override
  State<BallSidingScreen> createState() => _BallSidingScreenState();
}

class _BallSidingScreenState extends State<BallSidingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BallSlidingController>(
        init: BallSlidingController(),
        builder: (controller) {
          return Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  Image.asset(
                    'assets/images/bg.png',
                    fit: BoxFit.fitWidth,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Put the soccer ball close to 900",
                                style: AppTheme.lightTheme.textTheme.headline3
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                              ),

                              //--------------------------------

                              SizedBox(
                                height: 180,
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    thumbColor: Colors.transparent,
                                    activeTrackColor: Colors.red,
                                    inactiveTrackColor: Colors.grey[200],
                                    trackHeight: 2,
                                    overlayColor: Colors.transparent,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: (controller.sliderValue / 500) *
                                            MediaQuery.of(context).size.width,
                                        top: 20,
                                        child: Image.asset(
                                          'assets/images/ball.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      Slider(
                                        value: controller.sliderValue,
                                        divisions: 20,
                                        min: 0,
                                        max: 1000,
                                        onChanged: (value) {
                                          controller.sliderValueChange(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //-----------------------
                            ],
                          ),
                        ),
                        _sideMenu(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //-------------------------

  Widget _sideMenu() {
    final BallSlidingController controller = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
            isEnabled: true,
            padding: EdgeInsets.zero,
            icon: Image.asset(
              "assets/images/buttons/go_back.png",
            ),
            iconSize: iconSize,
            onPressed: () {},
          ),
        ),
        const Spacer(),
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
            isEnabled: true,
            padding: EdgeInsets.zero,
            icon: Image.asset(
              "assets/images/buttons/repeat.png",
            ),
            iconSize: iconSize,
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
              isEnabled: true,
              padding: EdgeInsets.zero,
              icon: Image.asset(
                "assets/images/buttons/toffee_shot.png",
              ),
              iconSize: iconSize,
              onPressed: () {}),
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
              isEnabled: true,
              padding: EdgeInsets.zero,
              icon: Image.asset(
                "assets/images/buttons/done.png",
              ),
              iconSize: iconSize,
              onPressed: () {
                controller.onTappedDoneButton();
              }),
        ),
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(microseconds: 300),
              child: TRIconButton(
                  isEnabled: true,
                  padding: EdgeInsets.zero,
                  icon: Image.asset(
                    "assets/images/buttons/skip.png",
                  ),
                  iconSize: iconSize,
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }

  //-------------------------
}
