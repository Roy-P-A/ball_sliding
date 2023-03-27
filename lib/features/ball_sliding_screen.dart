
import 'package:flutter/material.dart';


class BallSidingScreen extends StatefulWidget {
  const BallSidingScreen({Key? key}) : super(key: key);

  @override
  State<BallSidingScreen> createState() => _BallSidingScreenState();
}

class _BallSidingScreenState extends State<BallSidingScreen> {
  double _sliderValue = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Put the soccer ball close to 900"),

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
                      // left: (_sliderValue / 38) *
                      //     280, // adjust the position of the image based on the slider value

                      left: (_sliderValue / 102) * MediaQuery.of(context).size.width,
                      top: 20,
                      child: Image.asset(
                        'assets/images/ball.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      //divisions: 2,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )

            //-----------------------
          ],
        ),
      ),
    );
  }
}
