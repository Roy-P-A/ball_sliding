import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../ball_sliding.dart';
import 'package:get/get.dart';

class BallSlidingView extends StatelessWidget {
  final BallSlidingController controller;
  const BallSlidingView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Put the soccer ball close to ${controller.expectedValue.toInt()}",
              style: AppTheme.lightTheme.textTheme.headline3
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.blue),
            ),

            //--------------------------------

            LayoutBuilder(builder: (context, constraints) {
              return Obx(
                () => SizedBox(
                  height: 180,
                  width: constraints.maxWidth,
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
                          left: (controller.sliderValue / 1000) *
                              (constraints.maxWidth - 50),
                          top: 20,
                          child: Image.asset(
                            'assets/images/ball.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Slider(
                          inactiveColor: Colors.white,
                          value: controller.sliderValue,
                          divisions: 2,
                          min: 0,
                          max: controller.maximumRange,
                          onChanged: (value) {
                            controller.sliderValueChange(value);
                          },
                        ),
                        Positioned(
                          left: 24,
                          top: 93 ,
                          child: Column(
                            children: [
                              Container(
                                 width:3,
                                 height:13,
                                 color: Colors.red,
                              ),
                              const Text("0")
                            ],
                          ),
                        ),

                        Positioned(
                          left: constraints.maxWidth-26,
                          top: 93,
                          child: Column(
                            children: [
                              Container(
                                 width:3,
                                 height:13,
                                 color: Colors.red,
                              ),
                              Text(controller.maximumRange.toInt().toString())
                            ],
                          ),
                        ),

                        Positioned(
                          left: (constraints.maxWidth-2)/2,
                          top: 93,
                          child: Column(
                            children: [
                              Container(
                                 width:3,
                                 height:13,
                                 color: Colors.red,
                              ),
                              Text((controller.maximumRange/2).toInt().toString())
                            ],
                          ),
                          
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),

            //-----------------------
          ],
        ),
      ),
    );
  }
}
