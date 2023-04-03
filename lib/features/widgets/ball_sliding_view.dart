import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../ball_sliding.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BallSlidingView extends StatelessWidget {
  final BallSlidingController controller;
  const BallSlidingView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largeTab = MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 800;
    return Obx(
      () => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: MediaQuery(
                data: MediaQueryData(textScaleFactor: largeTab? 3: 1),
                child: Text(
                  "Put the soccer ball close to ${controller.expectedValue.toInt()}",
                  style:AppTheme.lightTheme.textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.blue),
                ),
              ),
            ),

            //-----------------

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(builder: (context, constraints) {
                return Obx(
                  () => SizedBox(
                    height: 180,
                    width: constraints.maxWidth,
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
                        SfSlider(
                          min: 0.0,
                          max: controller.maximumRange,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey[200],
                          value: controller.sliderValue,
                          interval: controller.maximumRange / 2,
                          stepSize: 50,
                          thumbShape: const SfThumbShape(),
                          showLabels: true,
                          showTicks: true,
                          showDividers: true,
                          enableTooltip: false,
                          onChanged: (dynamic newValue) {
                            controller.sliderValueChange(newValue);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            //-----------------------
          ],
        ),
      ),
    );
  }
}
